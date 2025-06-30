library(testthat)
library(cohortTdd)

test_that("Cohort validates correctly against all test patients", {
  # UPDATE THESE FILE NAMES FOR YOUR COHORT:
  patients_file <- system.file("testdata", "hct_patients.xlsx", package = "cohortTdd.demo")
  cohort_file <- system.file("testdata", "hct_cohort.json", package = "cohortTdd.demo")
  
  # Verify files exist
  expect_true(file.exists(patients_file), "Patient data file should exist")
  expect_true(file.exists(cohort_file), "Cohort definition file should exist")
  
  # Run validation
  results <- cohortTdd::validate_my_cohort(
    patients_file = patients_file,
    cohort_file = cohort_file,
    print_summary = TRUE
  )
  
  # Test that cohort validation succeeds (all patients validate as expected)
  expect_equal(results$failed_tests, 0)
  expect_equal(results$total_tests, 7)  # UPDATE: Expected number of test patients
  expect_equal(results$passed_tests, 7)  # UPDATE: Should match total_tests
})