# Format current location for 'nearby' item request
nearby_req <- function() {
  geoip <- "http://freegeoip.net/json/"
  geoip_data <- jsonlite::fromJSON(url(geoip))
  return(paste0("?longitude=", geoip_data$longitude, "&latitude=",
    geoip_data$latitude))
}

# Format 'neighbors' item request
neighbors_req <- function(spot_id, ...) {
  if (identical(spot_id, "")) {
    stop("You must provide a non-empty 'spot_id' parameter")
  }
  params <- list(...)
  if ("direction" %in% names(params)) {
    if (!(params[["direction"]] %in% c("above", "below"))) {
      stop(paste("The 'direction' parameter must be one of 'above'",
                 "or 'below'"))
    } else {
      return(paste0(spot_id, "/?direction=", params[["direction"]]))
    }
  } else {
    return(spot_id)
  }
}

# Format any additional 'search' item parameters
search_req <- function(...) {
  params <- list(...)
  params_req <- paste0("&", names(params), "=", params, collapse = "")
  params_req <- gsub("^&", "?", params_req)
  return(paste0("http://api.spitcast.com/api/spot-forecast/search",
          params_req))
}

# Unnest any long / lat pairs to columns
unnest_coords <- function(df) {
  if (!("coordinates" %in% names(df))) {
    stop("'coordinates' not found")
  }
  coords <- do.call(rbind, df[["coordinates"]])
  df$longitude <- coords[, 1]
  df$latitude <- coords[, 2]
  df$coordinates <- NULL
  return(df)
}
