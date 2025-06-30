# cohortTdd Demo

[![Test HCT Cohort](https://github.com/bill-baumgartner/cohortTdd.demo/actions/workflows/test-cohort.yml/badge.svg)](https://github.com/bill-baumgartner/cohortTdd.demo/actions/workflows/test-cohort.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-%3E%3D4.1.0-blue.svg)](https://www.r-project.org/)

This is a **demo project** showing cohort definition validation using the `cohortTdd` package. 

> **💡 Auto-Generate This Structure**: Instead of manually copying this template, you can automatically generate a new validation project using the `cohortTdd` package:
> ```r
> library(cohortTdd)
> setup_cohort_testing_project(
>   project_name = "my-cohort-demo",
>   cohort_name = "my_cohort",
>   author_name = "Your Name"
> )
> ```
> This creates the same structure with your own project name and placeholder files.

## Manual Template Usage

To use this template manually for your own cohort:

1. **Replace the sample data files** with your own
2. **Update file names** in the test file  
3. **Run validation**

## Sample Cohort (HCT Example)

The included example identifies patients with specific hematocrit (HCT) measurement patterns and exclusions based on:
- Testosterone exposure criteria
- Estradiol exposure exclusions  
- HCT measurement requirements before and after index date
- Minimum follow-up requirements

## Quick Start

### Prerequisites
```r
# Install the cohortTdd package
devtools::install_github("bill-baumgartner/cohortTdd")
```

### Run Validation
```r
# Run the validation tests
devtools::test()

# Or run validation directly
library(cohortTdd)
results <- validate_my_cohort(
  patients_file = system.file("testdata", "hct_patients.xlsx", package = "cohortTdd.demo"),
  cohort_file = system.file("testdata", "hct_cohort.json", package = "cohortTdd.demo")
)
```

## How to Customize This Template

### Step 1: Replace Data Files
1. Replace `inst/testdata/hct_patients.xlsx` with your patient data
2. Replace `inst/testdata/hct_cohort.json` with your cohort definition

### Step 2: Update Test File
Edit `tests/testthat/test_hct_cohort.R` and change these lines:
```r
# Change these file names to match your files:
patients_file <- system.file("testdata", "YOUR_patients.xlsx", package = "cohortTdd.demo")
cohort_file <- system.file("testdata", "YOUR_cohort.json", package = "cohortTdd.demo")

# Update expected counts:
expect_equal(results$total_tests, X)  # Your number of test patients
expect_equal(results$passed_tests, X) # Should match total_tests if all pass
```

### Step 3: Run Validation
```r
devtools::test()
```

That's it! The validation will run against your cohort and patient data.

## Files

- **`inst/testdata/hct_patients.xlsx`** - Synthetic patient data with explanation tab
- **`inst/testdata/hct_cohort.json`** - HCT cohort definition from ATLAS
- **`tests/testthat/test_hct_cohort.R`** - Test validating the cohort logic

## Patient Test Cases

The validation includes 7 test patients with known inclusion/exclusion patterns:

| Patient | Expected | Reason |
|---------|----------|--------|
| 1 | ✅ Include | Meets all criteria exactly |
| 2 | ❌ Exclude | Testosterone exposures <7 days apart |
| 3 | ❌ Exclude | Has estradiol exposure |
| 4 | ❌ Exclude | No HCT measurement before index date |
| 5 | ❌ Exclude | <4 HCT measurements after index date |
| 6 | ✅ Include | Meets all criteria exactly |
| 7 | ✅ Include | Meets all criteria exactly |

## Expected Results

- **3 patients should be included** (patients 1, 6, 7)
- **4 patients should be excluded** with specific reasons
- **100% test pass rate** when cohort logic is correct

## CI/CD Integration

This project includes GitHub Actions workflow for automated testing:

```yaml
# Runs on every push/PR
- Validates cohort definition
- Tests against all patient scenarios  
- Fails if any validation errors occur
```

## Usage as Template

You can use this project as a template for your own cohort validation:

1. **Copy this project structure**
2. **Replace inst/testdata/hct_patients.xlsx** with your patient data
3. **Replace inst/testdata/hct_cohort.json** with your cohort definition
4. **Update explanation tab** in your Excel file with expected results
5. **Update tests/testthat/test_hct_cohort.R** to reference your new package name in the `system.file()` calls
6. **Run validation**

## Project Structure

```
cohortTdd.demo/
├── inst/testdata/
│   ├── hct_patients.xlsx          # Patient test data
│   └── hct_cohort.json           # Cohort definition
├── tests/testthat/
│   └── test_hct_cohort.R         # Validation tests
├── .github/workflows/
│   └── test-cohort.yml           # CI/CD workflow
├── DESCRIPTION                    # Project metadata
└── README.md                     # This file
```

## Contributing

This is an example project demonstrating cohortTdd usage. For issues with the cohortTdd package itself, please file issues on the main package repository.

## License

MIT