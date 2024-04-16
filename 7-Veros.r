library(stats4)

a <- 4
n <- 11
p <- 0.75
theta <- 3.6

obs <- c(4.37,4.3,5.15,5.11,5.15,4.66,6.15,5.72,5.87,5.64,4.05)

fdp <- function(theta, a, x) {
  if (x >= a) { return (theta * x^(- theta - 1) * a^theta) }
  else { return (0) }
}

likelihood <- function(x) {
  return (prod(sapply(x, fdp, a = a, theta = theta)))
}

log_likelihood <- function(x) {
  return (sum(log(pdf(x, theta, a))))
}

result <- mle(log_likelihood, start = list(theta = 3.6), x = obs)
