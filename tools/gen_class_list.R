# extract IDD classs for all EnergyPlus versions
l <- lapply(eplusr:::ALL_IDD_VER, function(ver) {
    path <- eplusr:::find_idd_from_updater(ver)
    if (is.null(path)) {
        data.table::data.table()
    } else {
        idd <- eplusr:::parse_idd_file(path)
        idd$class[, list(
            group_id, class_id,
            class_name, class_name_upper = toupper(class_name),
            has_name
        )]
    }
})

dt_class <- data.table::rbindlist(l)

dt_class_uni <- unique(dt_class, by = "class_name")
data.table::setorderv(dt_class_uni, c("group_id", "class_id"))
data.table::set(dt_class_uni, NULL, "class_id", seq_along(dt_class_uni$class_id))
data.table::setcolorder(dt_class_uni, c("group_id", "class_id"))

data.table::fwrite(dt_class_uni, here::here("inst/extdata/class_list.csv"))
