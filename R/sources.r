satcat_src_URL <- "https://celestrak.com/satcat/sources.asp"

satcat_src <- function() {

  message("Loading sources...")

  read_html(satcat_src_URL) %>%
    html_nodes("table[cellpadding='3']") %>%
    html_table(header=TRUE) %>%
    .[[1]] %>%
    set_names(c("source", "source_full_name")) %>%
    mutate(source_full_name=stri_replace_all_regex(source_full_name, "[[:space:]]+", " ")) %>%
    as_tibble()

}
