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

    # init string column
    data.table::setnames(dt_object, "string", "class_string")
    data.table::set(dt_object, NULL, "object_string", dt_object$class_string)

    # extract object names
    ## for no-name object, directly use class location
    dt_object[has_name == FALSE,
        `:=`(object_name = sprintf("Object [%s]", object_id), object_line = line)
    ]

    ## for single-line object, directly use the remaining string
    dt_object[has_name == TRUE & !stringi::stri_isempty(body),
        `:=`(object_name = body, object_line = line)
    ]

    ## for normal object
    dt_object[has_name == TRUE & is.na(object_name), c("object_name", "object_line", "object_string") := {
        i <- which(dt_lines$line %in% line) + 1L
        name <- stringi::stri_split_charclass(dt_lines$body[i], "[,;]", n = 2L, simplify = TRUE)[, 1L]
        list(name, line + 1L, dt_lines$string[i])
    }]

    # in case there are still empty object names
    dt_object[stringi::stri_isempty(object_name), object_name := sprintf("Object [%s]", object_id)]

    # clean up
    data.table::set(dt_object, NULL, c("body", "class_name_upper", "has_name"), NULL)
    data.table::setnames(dt_object, "line", "class_line")
    data.table::setcolorder(dt_object, c(
        "class_id", "class_line", "class_name", "class_string",
        "object_id", "object_line", "object_name", "object_string"
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
#' - `class_string`: [character()] The raw input string for classes
#' - `object_id`: [integer()] Integers as the identifiers for each object detected.
#' - `object_line`: [integer()] Line numbers indicating where the objects are found
#' - `object_name`: [character()] Object names found
#' - `object_string`: [character()] The raw input string for objects
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

# imitate "--format=2 --excmd=mixed --sort=no --append=no"
build_tag_header <- function() {
    c(
        "!_TAG_FILE_FORMAT\t2\t/extended format; --format=1 will not append ;\" to lines/",
        "!_TAG_FILE_SORTED\t0\t/0=unsorted, 1=sorted, 2=foldcase/",
        "!_TAG_PROGRAM_AUTHOR\tHongyuan Jia\t/email: hongyuanjia@outlook.com/",
        "!_TAG_PROGRAM_NAME\tidftags R package\t//",
        "!_TAG_PROGRAM_URL\thttps://github.com/hongyuanjia/idftags\t//",
        sprintf("!_TAG_PROGRAM_VERSION\t%s\t/", utils::packageVersion("idftags")),
        "!_TAG_OUTPUT_MODE\tu-ctags\t/u-ctags or e-ctags/",
        "!_TAG_OUTPUT_FILESEP\tslash\tslash or backslash/",
        sprintf("!_TAG_PROC_CWD\t%s/\t//", normalizePath(getwd())),
        "!_TAG_OUTPUT_EXCMD\tmixed\t/number, pattern, mixed, or combineV2/",
        "!_TAG_KIND_DESCRIPTION!IDF\tc,class\t/EnergyPlus IDD classes/",
        "!_TAG_KIND_DESCRIPTION!IDF\to,object\t/EnergyPlus IDF objects/"
    )
}

build_tag_content <- function(path) {
    dt <- read_object_location(path)

    if (!nrow(dt)) {
        return(NULL)
    }

    path <- normalizePath(path, winslash = "\\")

    dt[, {
        # class tag
        class_tag <- sprintf(
            "%s\t%s\t/^%s$/;\"\t%s\tline:%s",
            stringi::stri_replace_all_fixed(class_name, ":", "_"),
            path,
            class_string,
            "c",
            class_line
        )

        # object tag
        object_tag <- sprintf(
            "%s\t%s\t/^%s$/;\"\t%s\tline:%s\tclass:%s",
            stringi::stri_replace_all_charclass(object_name, "[^0-9a-zA-Z]", "_"),
            path,
            object_string,
            "o",
            object_line,
            stringi::stri_replace_all_fixed(class_name, ":", "_")
        )

        c(class_tag, object_tag)
    }]
}

#' Build EnergyPlus IDF Tag file
#'
#' `build_idf_tags()` extracts the locations of classes and objects in the
#' input EnergyPlus IDF and creates a
#' [ctags](https://github.com/universal-ctags/ctags)-compatible tag file.
#'
#' @inheritParams read_object_location
#'
#' @param out [character()] The output tag file path. If `"|"`, the tag file
#' will be directly printed into stdout. Default: `"|"`.
#'
#' @param cmd [logical()] If `TRUE` and both `path` and `out` are missing, try
#' to read arguments using [commandArgs()] for `path` and `out`. This enables
#' you to use `build_idf_tags()` in the way like
#' `Rscript -e "idftags:: build_idf_tags(cmd = TRUE)" path`. Default: `FALSE`.
#'
#' @export
#' @examples
#' \dontrun{
#' if (requireNamespace("eplusr", quietly = TRUE)) {
#' build_idf_tags(system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr"))
#' }
#' }
build_idf_tags <- function(path, out = "|", cmd = FALSE) {
    if (isTRUE(cmd) && missing(path) && missing(out)) {
        args <- commandArgs(TRUE)
        if (length(args) == 0L) {
            stop("argument \"path\" is missing, with no default")
        } else if (length(args) == 1L) {
            path <- args[1L]
        } else {
            path <- args[1L]
            out <- args[2L]
        }
    }

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
    "object_tag", "string", "class_string", "object_id", "object_string"
))
