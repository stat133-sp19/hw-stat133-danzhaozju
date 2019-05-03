############################
# Test for summary measures

# load the source code of the functions to be tested

context("Test for summary measures")
############################
#context("Test for aux_mean()")

test_that("aux_mean() works as expected",{
  trials1 = 10
  prob1 = 0.3
  expect_equal(aux_mean(trials1,prob1),3)
  expect_length(aux_mean(trials1,prob1), 1)
  expect_type(aux_mean(trials1,prob1), 'double')
})

############################
#context("Test for aux_variance()")

test_that("aux_variance() works as expected",{
  trials1 = 10
  prob1 = 0.3
  expect_equal(aux_variance(trials1,prob1),2.1)
  expect_length(aux_variance(trials1,prob1), 1)
  expect_type(aux_variance(trials1,prob1), 'double')
})

############################
#context("Test for aux_mode()")

test_that("aux_mode() works as expected",{
  trials1 = 10
  prob1 = 0.3
  expect_equal(aux_mode(trials1,prob1),3)
  expect_length(aux_mode(trials1,prob1), 1)
  expect_type(aux_mode(trials1,prob1), 'double')
})

test_that("aux_mode() works as expected",{
  trials2 = 9
  prob2 = 0.5
  expect_equal(aux_mode(trials2,prob2),c(5,4))
  expect_length(aux_mode(trials2,prob2), 2)
  expect_type(aux_mode(trials2,prob2), 'double')
})

############################
#context("Test for aux_skewness()")

test_that("aux_skewness() works as expected",{
  trials1 = 10
  prob1 = 0.3
  expect_equal(round(aux_skewness(trials1,prob1),7),0.2760262)
  expect_length(aux_skewness(trials1,prob1), 1)
  expect_type(aux_skewness(trials1,prob1), 'double')
})

############################
#context("Test for aux_kurtosis()")

test_that("aux_kurtosis() works as expected",{
  trials1 = 10
  prob1 = 0.3
  expect_equal(round(aux_kurtosis(trials1,prob1),7),-0.1238095)
  expect_length(aux_kurtosis(trials1,prob1), 1)
  expect_type(aux_kurtosis(trials1,prob1), 'double')
})
