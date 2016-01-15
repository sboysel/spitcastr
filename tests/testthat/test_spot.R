library(spitcastr)
context("Test spot function")

id <- 1
df <- "data.frame"
chr <- "character"
srch <- "http://api.spitcast.com/api/spot-forecast/search?="
test_df <- spot(item = "neighbors", spot_id = id)

test_that("spot function throws errors for bad params", {
  expect_error(spot(item = "foo"))
  expect_silent(spot(item = "all"))
  expect_error(spot())
  expect_false("coordinates" %in% test_df)
})

test_that("spot function return proper types", {
  expect_is(spot(item = "all"), df)
  expect_is(spot(item = "forecast", spot_id = id), df)
  expect_is(spot(item = "nearby"), df)
  expect_is(spot(item = "neighbors", spot_id = id), df)
  expect_is(spot(item = "top"), df)
  expect_is(spot(item = "search"), df)
})

