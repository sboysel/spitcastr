library(spitcastr)
context("Test county function")

test_that("county function throws errors for bad params", {
  expect_error(county(item = "foo"))
  expect_error(county(item = "spots"))
})

test_that("county function returns a data.frame", {
  oc <- "Orange County"
  df <- "data.frame"
  expect_is(county(item = "spots", county_name = oc), df)
  expect_is(county(item = "swell", county_name = oc), df)
  expect_is(county(item = "tide", county_name = oc), df)
  expect_is(county(item = "temp", county_name = oc), df)
})
