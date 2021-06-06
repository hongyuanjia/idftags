read_idd_class <- function() {
    path <- system.file("extdata/class_list.csv", package = "idftags")
    data.table::fread(path)
}

#' @importFrom data.table data.table
#' @importFrom stringi stri_startswith_fixed
read_idf_lines <- function(path) {
    # read IDF lines
    dt_lines <- data.table::fread(input = path, sep = NULL, header = FALSE, col.names = "string")

    # add line index
    data.table::set(dt_lines, NULL, "line", seq_len(nrow(dt_lines)))

    # trim spaces
    data.table::set(dt_lines, NULL, 1L, stringi::stri_trim_both(dt_lines[[1]]))

    # remove empty lines and comments
    dt_lines <- dt_lines[!(stringi::stri_startswith_fixed(string, "!") | stringi::stri_isempty(string))]

    # remove field comments
    loc_cmt <- stringi::stri_locate_first_fixed(dt_lines$string, "!")[, 1L]
    data.table::set(dt_lines, NULL, "body", dt_lines$string)
    data.table::set(dt_lines, which(!is.na(loc_cmt)), "body",
        stringi::stri_trim_right(
            stringi::stri_sub(
                dt_lines$string[!is.na(loc_cmt)],
                to = loc_cmt[!is.na(loc_cmt)] - 1L
            )
        )
    )
}

#' @importFrom data.table ":="
sep_idf_lines <- function(dt_lines, class_list) {
    # only keep valid lines
    has_comma <- stringi::stri_endswith_fixed(dt_lines$body, ",")
    has_semicolon <- stringi::stri_endswith_fixed(dt_lines$body, ";")
    is_valid <- has_comma | has_semicolon
    dt_lines <- dt_lines[is_valid]

    # in case all invalid lines
    if (!nrow(dt_lines)) {
        return(data.table::data.table())
    }

    # update line indicator
    has_semicolon <- has_semicolon[is_valid]

    # number objects
    data.table::set(dt_lines, which(has_semicolon), "object_id", seq_len(sum(has_semicolon)))
    data.table::setnafill(dt_lines, "nocb", cols = "object_id")

    # extract object data
    dt_object <- dt_lines[dt_lines[, .I[1L], by = "object_id"]$V1]

    # extract class name in upper case
    data.table::set(dt_object, NULL, c("body", "class_name_upper"), {
        loc <- stringi::stri_locate_first_fixed(dt_object$body, ",")[, 1L]
        loc <- data.table::nafill(loc, "const", 0L)

        body <- stringi::stri_sub(dt_object$body, from = loc + 1L)
        class <- stringi::stri_sub(dt_object$body, to = loc - 1L)
        class <- stringi::stri_trans_toupper(class)
        class <- stringi::stri_trim_right(class)
        body <- stringi::stri_trim_left(body)
        list(body, class)
    })

    # match class name
    dt_object[class_list, on = c("class_name_upper"),
        `:=`(class_id = i.class_id, class_name = i.class_name, has_name = i.has_name)
    ]

    # remove invalid class names
    dt_object <- dt_object[!is.na(class_name)]

    # extract object names
    ## for single-line object, directly use the remaining string
    dt_object[has_name == TRUE & !stringi::stri_isempty(body),
        `:=`(object_name = body, object_line = line)]
    ## for normal object
    dt_object[has_name == TRUE & is.na(object_name), c("object_name", "object_line", "string") := {
        i <- which(dt_lines$line %in% line) + 1L
        name <- stringi::stri_split_charclass(dt_lines$body[i], "[,;]", n = 2L, simplify = TRUE)[, 1L]
        list(name, line + 1L, dt_lines$string[i])
    }]

    # clean up
    data.table::set(dt_object, NULL, c("body", "class_name_upper", "has_name"), NULL)
    data.table::setnames(dt_object, "line", "class_line")
    data.table::setcolorder(dt_object, c(
        "class_id", "class_line", "class_name",
        "object_id", "object_line", "object_name"
    ))
}

#' Read object locations
#'
#' `read_object_location()` extracts the locations of classes and objects in the
#' input EnergyPlus IDF.
#'
#' @param path [character()] A string specifying the path of an EnergyPlus IDF
#' file.
#'
#' @return A [data.table::data.table()] with 7 columns:
#'
#' - `class_id`: [integer()] Integers as the identifiers for each class detected.
#' - `class_line`: [integer()] Line numbers indicating where the classes are found
#' - `class_name`: [character()] Standard EnergyPlus class names
#' - `object_id`: [integer()] Integers as the identifiers for each object detected.
#' - `object_line`: [integer()] Line numbers indicating where the objects are found
#' - `object_name`: [character()] Object names found
#' - `string`: [character()] The raw input string
#'
#' @export
#' @examples
#' \dontrun{
#' if (requireNamespace("eplusr", quietly = TRUE)) {
#' read_object_location(system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr"))
#' }
#' }
read_object_location <- function(path) {
    sep_idf_lines(read_idf_lines(path), read_idd_class())[]
}

build_tag_header <- function() {
    c(
        "!_TAG_FILE_FORMAT\t2\t/",
        "!_TAG_FILE_SORTED\t1\t/",
        "!_TAG_PROGRAM_AUTHOR\tHongyuan Jia\t/hongyuanjia@outlook.com/",
        "!_TAG_PROGRAM_NAME\tidftags\t/",
        sprintf("!_TAG_PROGRAM_VERSION\t%s\t/", utils::packageVersion("idftags"))
    )
}

build_tag_content <- function(path) {
    dt <- read_object_location(path)

    if (!nrow(dt)) {
        return(NULL)
    }

    path <- normalizePath(path, winslash = "\\")

    dt[, class_tag := sprintf(
        "%s\t%s\t/^%s$/;\"\tkind:c\tline:%s",
        class_name,
        path,
        string,
        class_line
    )]

    dt[!is.na(object_line), object_tag := sprintf(
        "%s\t%s\t/^%s$/;\"\tkind:m\tline:%s",
        object_name,
        path,
        string,
        object_line
    )]

    dt[is.na(object_line), `:=`(tag = as.list(class_tag))]
    dt[!is.na(object_line), `:=`(tag = list(c(class_tag, object_tag))), by = "object_id"]

    unlist(dt$tag, FALSE, FALSE)
}

#' Build EnergyPlus IDF Tag file
#'
#' `build_idf_tag()` extracts the locations of classes and objects in the
#' input EnergyPlus IDF and creates a
#' [ctags](https://github.com/universal-ctags/ctags)-compatible tag file.
#'
#' @inheritParams read_object_location
#'
#' @param out [character()] The output tag file path. If `"|"`, the tag file
#' will be directly printed into stdout. Default: `"|"`
#'
#' @export
#' @examples
#' \dontrun{
#' if (requireNamespace("eplusr", quietly = TRUE)) {
#' build_idf_tag(system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr"))
#' }
#' }
build_idf_tag <- function(path, out = "|") {
    class_list <- read_idd_class()

    tag <- c(
      build_tag_header(),
      build_tag_content(path)
    )

    if (out == "|") {
        cat(tag, sep = "\n")
    } else {
        writeLines(tag, out)
        invisible()
    }
}

utils::globalVariables(c(
    ".I", "class_line", "class_name", "class_tag", "has_name", "i.class_id",
    "i.class_name", "i.has_name", "line", "object_line", "object_name",
    "object_tag", "string"
))
