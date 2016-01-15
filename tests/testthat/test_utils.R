library(spitcastr)
context("Test utility functions")

a <- paste0("http://api.spitcast.com/api/spot/nearby?longitude=",
            "-122.005261&latitude=37.02188")
b <- data.frame(x = runif(2), y = runif(2))
c <- jsonlite::fromJSON(url(a))
d <- search_req(foo = "bar", baz = 1)
e <- neighbors_req(spot_id = 1, direction = "above")
f <- nearby_req()

test_that("unnest_coords functions properly", {
  expect_error(unnest_coords(b))
  expect_silent(unnest_coords(c))  
  expect_is(unnest_coords(c), "data.frame")
  expect_true(ncol(c) < ncol(unnest_coords(c)))
})

test_that("search_req functions properly", {
  expect_is(d, "character")
  expect_true(grepl("^http://api.spitcast.com/api/spot-forecast", d))
  expect_true(grepl("foo", d))
  expect_true(grepl("bar", d))
  expect_true(grepl("baz", d))
  expect_true(grepl("1", d))
})

test_that("neighbors_req functions properly", {
  expect_is(e, "character")
  expect_true(grepl("above", e))
  expect_error(neighbors_req())
  expect_error(neighbors_req(spot_id = ""))
  expect_error(neighbors_req(spot_id = 1, direction = "sideways"))
})

test_that("nearby_req functions properly", {
  expect_is(f, "character")
  expect_false(identical(f, ""))
})
