context("basic functionality")
test_that("we can do something", {

  expect_that(read_satcat(), is_a("data.frame"))

})
