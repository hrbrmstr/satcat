#' Tools to Work with the 'CelesTrak' Satellite Catalog API
#'
#' T.S. Kelso has been  transcribing NORAD's "resident space object" data for decades.
#' One component of of this is the 'SATCAT' satellite catalog (<https://celestrak.com/satcat/search.asp>),
#' which provides data on all known satellites launched since 1957.
#'
#' @name satcat
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom xml2 read_html
#' @importFrom rvest  html_nodes html_table
#' @importFrom readr read_lines read_fwf fwf_positions cols
#' @importFrom purrr map map_df set_names
#' @importFrom tibble as_tibble
#' @importFrom dplyr data_frame mutate left_join
#' @importFrom httr GET stop_for_status content
#' @importFrom stringi stri_split_fixed stri_replace_all_regex
NULL
