satcat_URL <- "https://celestrak.com/pub/satcat.txt"

#' Read in a complete SATCAT database complete with expanded status code, site code and
#' launch source codes.
#'
#' @export
#' @examples
#' satcat_df <- read_satcat()
read_satcat <- function() {

  satcat_col_names <- c("designator", "norad_cat_num", "multiple", "payload", "op_status_code",
                        "satellite_name", "source", "launch_date" , "launch_site", "decay_date",
                        "orbital_period", "inclination", "apogee", "perigee", "radar_cross_section",
                        "orbital_status_code")

  satcat_cols <- cols(designator = "c", norad_cat_num = "c", multiple = "c", payload = "c",
                      op_status_code = "c", satellite_name = "c", source = "c", launch_date = "D",
                      launch_site = "c", decay_date = "D", orbital_period = "d", inclination = "d",
                      apogee = "d", perigee = "d", radar_cross_section = "d", orbital_status_code = "c")

  satcat_cols_start <- c(1, 14, 20, 21, 22, 24, 50, 57, 69, 76, 88, 97, 104, 112, 120, 130)
  satcat_cols_end <- c(11, 18, 20, 21, 22, 47, 54, 66, 73, 85, 94, 101, 109, 117, 127, 132)

  read_fwf(satcat_URL, na=c("N/A"), col_types=satcat_cols,
           fwf_positions(satcat_cols_start, satcat_cols_end, satcat_col_names)) %>%
    mutate(multiple=(multiple=="M"), payload=(payload=="*")) %>%
    left_join(satcat_src(), by="source") %>%
    left_join(satcat_sites(), by="launch_site") %>%
    left_join(op_status(), by="op_status_code") %>%
    mutate(is_active=(op_status_code %in% c("+", "P", "B", "S", "X")))

}
