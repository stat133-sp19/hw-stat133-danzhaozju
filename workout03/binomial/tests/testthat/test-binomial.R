############################
# Test for binomial

# load the source code of the functions to be tested

context("Test for binomial")
############################
#context("Test for bin_choose()")

test_that("bin_choose() works as expected",{
  n1 = 5
  k1 = 2
  expect_equal(bin_choose(n1,k1),10)
  expect_length(bin_choose(n1,k1), 1)
  expect_type(bin_choose(n1,k1), 'double')
})

test_that("bin_choose() works as expected",{
  n2 = 5
  k2 = 0
  expect_equal(bin_choose(n2,k2),1)
  expect_length(bin_choose(n2,k2), 1)
  expect_type(bin_choose(n2,k2), 'double')
})

test_that("bin_choose() works as expected",{
  n3 = 5
  k3 = 1:3
  expect_equal(bin_choose(n3,k3),c(5,10,10))
  expect_length(bin_choose(n3,k3), 3)
  expect_type(bin_choose(n3,k3), 'double')
})

############################
#context("Test for bin_probability()")

test_that("bin_probability() works as expected",{
  success1 = 0:2
  trials1 = 5
  prob1 = 0.5
  expect_equal(bin_probability(success1,trials1,prob1),c(0.03125,0.15625,0.31250))
  expect_length(bin_probability(success1,trials1,prob1), 3)
  expect_type(bin_probability(success1,trials1,prob1), 'double')
})

test_that("bin_probability() works as expected",{
  success2 = 0:6
  trials2 = 5
  prob2 = 0.5
  expect_error(bin_probability(success2,trials2,prob2),
               "success cannot be greater than trials")
})

############################
context("Test for bin_distribution()")

test_that("bin_probability() works as expected",{
  trials1 = 5
  prob1 = 0.5
  expect_is(bin_distribution(trials1, prob1), c("bindis","data.frame"))
  expect_named(bin_distribution(trials1, prob1), c("success","probability"))
  expect_equal(nrow(bin_distribution(trials1, prob1)), 6)
})

############################
#context("Test for bin_cumulative()")

test_that("bin_cumulative() works as expected",{
  trials1 = 5
  prob1 = 0.5
  expect_is(bin_cumulative(trials1, prob1), c("bincum","data.frame"))
  expect_named(bin_cumulative(trials1, prob1), c("success","probability","cumulative"))
  expect_equal(nrow(bin_cumulative(trials1, prob1)), 6)
})




