#' Get spot information from the Spitcast API
#'
#' @param item The name of the specific spot data item as a string.  Must must
#' be one of 'all', 'forecast', 'nearby', 'neighbors', 'top', or 'search'.
#' Required.  Default is 'all'.
#' @param spot_id The spot ID to query, as an integer.  Required for the
#' 'forecast', and 'neighbors' items.  Default is \code{NULL}.
#' @param ... Any additional parameters passed to specific data items.  For
#' example, the 'neighbors' item takes an optional 'direction' parameter.
#' @examples
#' spot(item = "all")
#' spot(item = "nearby")
#' spot(item = "search", size_min = 1, shape_min = 1, distance = 10)
#' spot(item = "neighbors", spot_id = 1, direction = "above")
#' spot(item = "forecast", spot_id = 1)
#' @export
spot <- function(item = "all", spot_id = NULL, ...) {

  if (!(item %in% c("all", "forecast", "nearby", "neighbors",
                    "top", "search"))) {
    stop(paste("`item`` parameter must be one of 'all', 'forecast', 'nearby'",
         "'neighbors', 'top', or 'search'."))
  }

  if (item %in% c("forecast", "neighbors") & is.null(spot_id)) {
    stop("`spot_id` parameter is required for the 'forecast', and 'neighbors' items.")
  }

  spitcast_spot <- "http://api.spitcast.com/api/spot"

  req <- switch(
    item,
    all = paste0(spitcast_spot, "/all"),
    forecast = paste0(spitcast_spot, "/forecast/", spot_id),
    nearby = paste0(spitcast_spot, "/nearby", nearby_req()),
    neighbors = paste0(spitcast_spot, "/neighbors/",
    neighbors_req(spot_id, ...)),
    search = search_req(...),
    top = "http://api.spitcast.com/api/top/spots/"
  )

  resp <- jsonlite::fromJSON(url(req), flatten = TRUE)

  if ("coordinates" %in% names(resp)) {
    return(unnest_coords(resp))
  } else {
    return(resp)
  }

}

