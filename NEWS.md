# sample.cohort.validation 0.1.0

## Initial Release

### Template Features

* **Streamlined template**: Simple template for cohort validation with minimal setup required
* **Easy customization**: Users only need to replace data files and update file names in test
* **HCT cohort example**: Complete working example with synthetic patient data and cohort definition
* **No complex exports**: Direct use of cohortTdd functions keeps template simple

### How to Use

1. **Replace data files** in `inst/testdata/` with your own patient Excel and cohort JSON files
2. **Update file names** in `tests/testthat/test_hct_cohort.R`
3. **Run validation** with `devtools::test()`

### Package Structure

* Minimal R package structure focused on being a template
* Sample data in `inst/testdata/` demonstrates proper file formats
* Single test file shows how to run validation
* Clear documentation for customization

### Sample Data

* **Patient data**: 7 synthetic patients with various HCT measurement patterns
* **Cohort definition**: JSON cohort definition with specific inclusion/exclusion criteria
* **Expected results**: Documented validation outcomes for each patient
* **Test coverage**: Demonstrates all possible validation scenarios

### Documentation

* **README**: Step-by-step customization instructions
* **Clear examples**: Shows exactly what users need to change
* **Template focused**: Emphasizes ease of adaptation for new cohorts