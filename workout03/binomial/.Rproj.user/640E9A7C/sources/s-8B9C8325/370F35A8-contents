
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"binomial"` is a package that provides functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

-   The function `bin_choose()` calculates the number of combinations in which k successes can occur in n trials.
-   The function `bin_probability()` can calculate probabilities of getting certain successes in certain trials.
-   The function `bin_distribution()` returns a data frame with the probability distribution: sucesses in the first column, probability in the second column.
-   The function `bin_cumulative()` calculates both the probability distribution and the cumulative probabilities
-   The function `bin_variable()` creates an object of class “binvar”
-   The functions `bin_mean()`, `bin_variance()`, `bin_mode()`, `bin_skewness()`, `bin_kurtosis()` calculate the summary measures.
-   `plot.bincum()` method for a `"bincum"` object to graph the cumulative distribution
-   `plot.bindis()` method for a `"bindis"` object to graphs a barplot to display the probability histogram
-   `print.binvar()` method for a `"binvar"` object to nicely print the content
-   `summary.binvar()` method for a `"binvar"` object to get a full summary description
-   `"print.summary.binvar()"` method for a `"summary.binvar"` object to nicely print the contents

Motivation
----------

This package has been developed to provides functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 
# install "cointoss" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-danzhaozju/workout03/binomial")
#> Downloading GitHub repo stat133-sp19/hw-stat133-danzhaozju@master
#>   
   checking for file ‘/private/var/folders/tj/5ncv4ctn0q9dmg7tmg14hzn00000gn/T/Rtmp4hRzOb/remotes3d476c9ba2f4/stat133-sp19-hw-stat133-danzhaozju-3343a9e/workout03/binomial/DESCRIPTION’ ...
  
✔  checking for file ‘/private/var/folders/tj/5ncv4ctn0q9dmg7tmg14hzn00000gn/T/Rtmp4hRzOb/remotes3d476c9ba2f4/stat133-sp19-hw-stat133-danzhaozju-3343a9e/workout03/binomial/DESCRIPTION’
#> 
  
─  preparing ‘binomial’:
#> 
  
   checking DESCRIPTION meta-information ...
  
✔  checking DESCRIPTION meta-information
#> 
  
─  checking for LF line-endings in source and make files and shell scripts
#> 
  
─  checking for empty or unneeded directories
#> 
  
─  building ‘binomial_0.1.0.tar.gz’
#> 
  
   
#> 
# install "cointoss" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-danzhaozju/workout03/binomial", build_vignettes = TRUE)
#> Skipping install of 'binomial' from a github remote, the SHA1 (3343a9e2) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

Usage
-----

``` r
library(binomial)

bin_choose(n = 5, k = 2)
#> [1] 10
bin_choose(5, 0)
#> [1] 1
bin_choose(5, 1:3)
#> [1]  5 10 10

# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(success = 2, trials = 5, prob = 0.5)
#> [1] 0.3125

# probabilities of getting 2 or less successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(success = 0:2, trials = 5, prob = 0.5)
#> [1] 0.03125 0.15625 0.31250

# 55 heads in 100 tosses of a loaded coin with 45% chance of heads
bin_probability(success = 55, trials = 100, prob = 0.45)
#> [1] 0.01075277

# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

# plotting binomial probability distribution
dis1 <- bin_distribution(trials = 5, prob = 0.5)
plot(dis1)
```

![](README-unnamed-chunk-3-1.png)

``` r

# binomial cumulative distribution
bin_cumulative(trials = 5, prob = 0.5)
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000

# plotting binomial cumulative distribution
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
plot(dis2)
```

![](README-unnamed-chunk-3-2.png)

``` r

var1 = bin_variable(5,0.5)

bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
#> "Binomial variable"
#> 
#> Parameters
#>  - number of trials:  10 
#>  - prob of success :  0.3

bin1 <- bin_variable(trials = 10, p = 0.3)
binsum1 <- summary(bin1)
binsum1
#> "Binomial variable"
#> 
#> Parameters
#>  - number of trials:  10 
#>  - prob of success :  0.3 
#> 
#>  Measures
#>  - mean    : 3 
#>  - variance: 2.1 
#>  - mode    : 3 
#>  - skewness: 0.2760262 
#>  - kurtosis: -0.1238095

bin_mean(10, 0.3)
#> [1] 3
bin_variance(10, 0.3)
#> [1] 2.1
bin_mode(10, 0.3)
#> [1] 3
bin_skewness(10, 0.3)
#> [1] 0.2760262
bin_kurtosis(10, 0.3)
#> [1] -0.1238095
```
