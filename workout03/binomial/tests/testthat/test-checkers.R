############################
# Test for checkers

# load the source code of the functions to be tested

context("Test for checkers")
############################
#context("Test for check_prob()")

test_that("check_prob() works as expected",{
  prob1 = 0.5
  expect_true(check_prob(prob1))
  expect_length(check_prob(prob1), 1)
  expect_type(check_prob(prob1), 'logical')
})

test_that("check_prob() works as expected",{
  prob2 = c(1,2)
  expect_error(check_prob(prob2),"invalid prob length. prob shold be of length 1")
})

test_that("check_prob() works as expected",{
  prob3 = 1.1
  expect_error(check_prob(prob3),"invalid prob value. prob has to be a number betwen 0 and 1")
})

############################
#context("Test for check_trials()")

test_that("check_trials() works as expected",{
  trials1 = 3
  expect_true(check_trials(trials1))
  expect_length(check_trials(trials1), 1)
  expect_type(check_trials(trials1), 'logical')
})

test_that("check_trials() works as expected",{
  trials2 = 3.5
  expect_error(check_trials(trials2),
               "invalid trials value. trials should be a non-negative integer")
})

test_that("check_trials() works as expected",{
  trials3 = c(3,4)
  expect_error(check_trials(trials3),
               "invalid trials length. trials shold be of length 1")
})

############################
#context("Test for check_success()")

test_that("check_success() works as expected",{
  success1 = c(2,3,4)
  trials1 = 5
  expect_true(check_success(success1,trials1))
  expect_length(check_success(success1,trials1), 1)
  expect_type(check_success(success1,trials1), 'logical')
})

test_that("check_success() works as expected",{
  success2 = 5
  trials2 = 3
  expect_error(check_success(success2,trials2),
               "success cannot be greater than trials")
})

test_that("check_trials() works as expected",{
  success3 = c(3,3.5)
  trials3 = 5
  expect_error(check_success(success3,trials3),
               "invalid success value. success should be a non-negative integer")
})




