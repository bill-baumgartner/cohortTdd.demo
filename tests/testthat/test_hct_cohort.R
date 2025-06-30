library(testthat)
library(cohortTdd)

test_that("Cohort validates correctly against all test patients", {
  # UPDATE THESE FILE NAMES FOR YOUR COHORT:
  patients_file <- system.file("testdata", "hct_patients.xlsx", package = "cohortTdd.demo")
  cohort_file <- system.file("testdata", "hct_cohort.json", package = "cohortTdd.demo")
  
  # Verify files exist
  expect_true(file.exists(patients_file), "Patient data file should exist")
  expect_true(file.exists(cohort_file), "Cohort definition file should exist")
  
  # Run validation with detailed error logging
  cat("Starting cohort validation...\n")
  cat("Patient file:", patients_file, "\n")
  cat("Cohort file:", cohort_file, "\n")
  cat("Working directory:", getwd(), "\n")
  cat("Temp directory:", tempdir(), "\n")
  
  # Check file readability
  tryCatch({
    patient_data <- readxl::read_excel(patients_file, sheet = "explanation")
    cat("Successfully read explanation sheet with", nrow(patient_data), "rows\n")
  }, error = function(e) {
    cat("Error reading patient file:", conditionMessage(e), "\n")
  })
  
  tryCatch({
    cohort_json <- jsonlite::fromJSON(cohort_file)
    cat("Successfully parsed cohort JSON\n")
  }, error = function(e) {
    cat("Error reading cohort file:", conditionMessage(e), "\n")
  })
  
  # Run validation with error handling
  results <- tryCatch({
    cohortTdd::validate_my_cohort(
      patients_file = patients_file,
      cohort_file = cohort_file,
      print_summary = TRUE
    )
  }, error = function(e) {
    cat("ERROR in validate_my_cohort():\n")
    cat("Message:", conditionMessage(e), "\n")
    cat("Class:", class(e), "\n")
    if (exists("traceback")) {
      cat("Traceback:\n")
      print(traceback())
    }
    stop(e)
  })
  
  # Test that cohort validation succeeds (all patients validate as expected)
  expect_equal(results$failed_tests, 0)
  expect_equal(results$total_tests, 7)  # UPDATE: Expected number of test patients
  expect_equal(results$passed_tests, 7)  # UPDATE: Should match total_tests
})