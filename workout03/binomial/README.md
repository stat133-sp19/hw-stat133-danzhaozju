
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
-   `"print.summary.binvar()"` method for a `"summary.binvar"` object to nicely print the contents
-   `summary.binvar()` method for a `"binvar"` object to get a full summary description
