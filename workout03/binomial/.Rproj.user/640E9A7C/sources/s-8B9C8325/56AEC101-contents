# Here are the functions in this package.
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

####################################
# 1.1) Private Checker Functions
# Function check_prob():a private auxiliary function to test if an input prob is a valid probability value (i.e. 0<=p<=1).
check_prob <- function(prob){
  if (length(prob)!=1){
    stop("invalid prob length. prob shold be of length 1")
  }else if (prob < 0 | prob >1){
    stop("invalid prob value. prob has to be a number betwen 0 and 1")
  }else{
    return (TRUE)
  }
}

# Function check_trials():a private auxiliary function to test if an input trials is a valid value for number of trials (i.e. n is a non-negative integer).
check_trials <- function(trials){
  if (length(trials)!=1){
    stop("invalid trials length. trials shold be of length 1")
  }else if (trials < 0 | round(trials) != trials){
    stop("invalid trials value. trials should be a non-negative integer")
  }else{
    return (TRUE)
  }
}

# Function check_success():a private auxiliary function to test if an input success is a valid value for number of successes (i.e. 0<=k<=n).
check_success <- function(success,trials){
  if (any(success > trials)){
    stop("success cannot be greater than trials")
  }else if(any(round(success)!=success) == TRUE){
    stop("invalid success value. success should be a non-negative integer")
  }else{
    return (TRUE)
  }
}

####################################
# 1.2) Private Auxiliary Functions
# mean of a binomial distribution
aux_mean <- function(trials, prob){
  return (trials*prob)
}

# variance of a binomial distribution
aux_variance <- function(trials, prob){
  return (trials*prob*(1-prob))
}

# mode of a binomial distribution
aux_mode <- function(trials, prob){
  num <- trials*prob+prob
  if (round(num)==num){
    return (c(num,num-1))
  }else{
    return (floor(num))
  }
}

# skewness of a binomial distribution
aux_skewness <- function(trials, prob){
  skewness <- (1-2*prob) / (sqrt(trials*prob*(1-prob)))
  return (skewness)
}

# kurtosis of a binomial distribution
aux_kurtosis <- function(trials, prob){
  kurtosis <- (1-6*prob*(1-prob))/(trials * prob * (1-prob))
  return (kurtosis)
}

####################################
# 1.3) Function bin_choose()
# main function bin_choose() that calculates the number of combinations in which k successes can occur in n trials.

#' @title number of combination
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n the number of trials
#' @param k the number of success
#' @return then number of combination
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#'
#' bin_choose(5, 0)
#'
#' # k can be a vector
#' bin_choose(5, 1:3)
#'
bin_choose <- function(n,k){
  if (any(k > n)){
    stop("k cannot be greater than n")
  }else{
    comb <- factorial(n) / factorial(k) / factorial(n-k)
    return (comb)
  }
}

####################################
# 1.4) Function bin_probability()
#' @title probability of binomial distribution
#' @description calculates the probability of binomial distribution
#' @param success the number of success
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return the binomial probability
#' @export
#' @examples
#' # probability of getting 2 successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)

#' # probabilities of getting 2 or less successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)

#' # 55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#'
bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  probability <- bin_choose(trials, success) * prob^success * (1-prob)^(trials-success)
  return (probability)
}

####################################
# 1.5) Function bin_distribution()
#' @title binomial probability distribution
#' @description calculates binomial probability distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return binomial probability distribution
#' @export
#' @examples
#' # binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)
#'
bin_distribution <- function(trials, prob){
  success <-  0:trials
  probability <- bin_probability(success, trials, prob)
  distribution <- data.frame(success = success, probability = probability)
  class(distribution) <- c("bindis","data.frame")
  return (distribution)
}

# Function plot.bindis()
#' @export
plot.bindis <- function(x,...){
  barplot(x$probability,names.arg = x$success,
          border = NA,
          xlab = "successes",ylab = "probability")
}

####################################
# 1.6) Function bin_cumulative()
#' @title binomial cumulative distribution
#' @description calculates binomial cumulative distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return binomial cumulative distribution
#' @export
#' @examples
#' # plotting binomial cumulative distribution
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)
#'
bin_cumulative <- function(trials, prob){
  df <- bin_distribution(trials, prob)
  cumulative = rep(0,trials+1)
  probability = df$probability
  for (i in 1:(trials+1)){
    if (i==1){
      cumulative[1] = probability[1]
    }else{
      cumulative[i] = cumulative[i-1] + df$probability[i]
    }
  }
  df["cumulative"] = cumulative
  class(df) <- c("bincum","data.frame")
  return (df)
}

# Function plot.bincum()
#' @export
plot.bincum <- function(x,...){
  plot(x$success, x$cumulative,
       type = "o",
       xlab = "successes", ylab = "cumulative probability")
}

####################################
# 1.7) Function bin_variable()
#' @title binomial random variable
#' @description store binomial random variables
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return a list containing binomial random variables
#' @export
#' @examples
#' var1 = bin_variable(5,0.5)
#'
bin_variable <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  ls <- list(trials=trials,prob=prob)
  class(ls) <- "binvar"
  return (ls)
}

# Method print.binvar()
#' @export
print.binvar <- function(x,...){
  cat('"Binomial variable"\n\n')
  trials <- x$trials
  prob <- x$prob
  cat('Parameters\n',"- number of trials: ",trials,"\n","- prob of success : ",prob)
  invisible(x)
}

# Method summary.binvar()
#' @export
summary.binvar <- function(object,...){
  trials <- object$trials
  prob <- object$prob
  ls <- list(trials = trials,
             prob = prob,
             mean = aux_mean(trials,prob),
             variance = aux_variance(trials,prob),
             mode = aux_mode(trials,prob),
             skewness = aux_skewness(trials,prob),
             kurtosis = aux_kurtosis(trials,prob)
  )
  class(ls) <- "summary.binvar"
  return (ls)
}

# Method print.summary.binvar()
#' @export
print.summary.binvar <- function(x,...){
  cat('"Binomial variable"\n\n')
  cat("Parameters\n",
      "- number of trials: ",x$trials,"\n",
      "- prob of success : ",x$prob,"\n\n",
      "Measures\n",
      "- mean    :",x$mean,"\n",
      "- variance:",x$variance,"\n",
      "- mode    :",x$mode,"\n",
      "- skewness:",x$skewness,"\n",
      "- kurtosis:",x$kurtosis,"\n"
  )
  invisible(x)
}

####################################
# 1.8) Functions of measures
#' @title mean of a binomial distribution
#' @description calculate the mean of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return mean of a binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)
#'
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_mean(trials, prob))
}

#' @title variance of a binomial distribution
#' @description calculate the variance of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return variance of a binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
#'
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_variance(trials, prob))
}

#' @title mode of a binomial distribution
#' @description calculate the mode of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return mode of a binomial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)
#'
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_mode(trials, prob))
}

#' @title skewness of a binomial distribution
#' @description calculate the skewness of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return skewness of a binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)
#'
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_skewness(trials, prob))
}

#' @title kurtosis of a binomial distribution
#' @description calculate the kurtosis of a binomial distribution
#' @param trials the number of trials
#' @param prob the probability of success on rach trial
#' @return kurtosis of a binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
#'
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return (aux_kurtosis(trials, prob))
}




