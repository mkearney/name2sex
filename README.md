
<!-- README.md is generated from README.Rmd. Please edit that file -->
⚤ name2sex
==========

The goal of name2sex is to convert a vector of first names into sex estimates (female percent) based on historical data bases.

Installation
------------

You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mkearney/name2sex")
```

Example
-------

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
