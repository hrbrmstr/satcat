satcat_opstat_URL <- "https://celestrak.com/satcat/status.asp"

op_status <- function() {

  message("Loading status...")

  read_html(satcat_opstat_URL) %>%
    html_nodes("table[cellpadding='3']") %>%
    html_table(header=TRUE) %>%
    .[[1]] %>%
    set_names(c("op_status_code", "op_status_descr")) %>%
    mutate(op_status_descr=stri_replace_all_regex(op_status_descr, "[[:space:]]+", " ")) %>%
    as_tibble()

}
