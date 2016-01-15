#' Get county information from the Spitcast API 
#' 
#' @param item The name of the specific county data item as a string.  Must be
#' one of must be one of 'spots', 'swell', 'tide', 'water-temperature', or 
#' 'wind'. Required.
#' @param county_name The county name to query, as a string.  Required.
#' @examples
#' county(item = "spots", county_name = "Orange County")
#' county(item = "swell", county_name = "Los Angeles")
#' @export
county <- function(item, county_name = "") {
  if (!(item %in% c("spots", "swell", "tide", "temp",
                    "wind"))) {
    stop(paste("item parameter must be one of 'spots', 'swell', 'tide'",
         "'water-temperature', or 'wind'"))
  }
  if (identical(county_name, "")) {
    stop("You must provide a non-empty 'county_name' parameter")
  }
  spitcast_county <- "http://api.spitcast.com/api/county/"
  county_name_parsed <- gsub(" ", "-", tolower(county_name))
  req_url <- paste0(spitcast_county, ifelse(item == "temp",
    "water-temperature", item), "/", county_name_parsed)
  resp <- jsonlite::fromJSON(url(req_url), flatten = TRUE)
  if (item == "temp") {
    return(data.frame(resp))
  } else {
    return(resp)
  }
}
