
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ⚤ name2sex <img src="man/figures/logo.png" width="160px" align="right" />

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The goal of name2sex is to convert a vector of first names into sex
estimates (female percent) based on historical data bases.

## NOTE

If you’re reading this, I’d encourage you to check out
<https://github.com/ropensci/gender> instead. In making this package, we
made some decisions that are probably not completely obvious. So it’d be
more transparent \[and probably all-around better\] to use the
<https://github.com/ropensci/genderdata> and
<https://github.com/ropensci/gender> packages directly\!

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mkearney/name2sex")
```

## Example

This is a basic example:

``` r
## load package
library(name2sex)

## vector of first names
first_names <- c("casi", "mike", "tracy", "rory", "pat", "alex", "tamar")

## apply names2sex function to first names
names2sex(first_names)
#>       casi       mike      tracy       rory        pat       alex 
#> 1.00000000 0.00313833 0.80361373 0.16616643 0.58198674 0.02903625 
#>      tamar 
#> 0.86616352
```
