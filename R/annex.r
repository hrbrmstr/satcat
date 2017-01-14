satcat_annex_URL <- "https://celestrak.com/pub/satcat-annex.txt"

annex <- function() {

  message("Loading annex...")

  read_lines(satcat_annex_URL) %>%
    stri_split_fixed("|", 2) %>%
    map_df(~data_frame(norad_cat_num=.[1],
                       name=flatten_chr(stri_split_fixed(.[2], "|"))))

}
