satcat_sites_URL <- "https://celestrak.com/satcat/launchsites.asp"

satcat_sites <- function() {

  message("Loading sites...")

  read_html(satcat_sites_URL) %>%
    html_nodes("table[cellpadding='3']") %>%
    html_table(header=TRUE) %>%
    .[[1]] %>%
    set_names(c("launch_site", "launch_site_full_name")) %>%
    mutate(launch_site_full_name=stri_replace_all_regex(launch_site_full_name, "[[:space:]]+", " ")) %>%
    as_tibble() -> satcat_sites

}
