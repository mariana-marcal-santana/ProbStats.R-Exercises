library(stats4)

a <- 4
p <- 0.75
obs <- c(4.37,4.3,5.15,5.11,5.15,4.66,6.15,5.72,5.87,5.64,4.05)

# Definir a funções
fdp <- function(x, theta, a) {
  ifelse(x >= a, theta * x^(-theta - 1) * a^theta, 0)
}

log_likelihood <- function(theta) {
  n <- length(obs)
  sum(log(fdp(obs, theta, a)))
}

neg_log_likelihood <- function(theta) {
  -log_likelihood(theta)
}

quantile_function <- function(p, theta, a) {
  return(a / (1 - p)^(1 / theta))
}

# Usar a função mle para estimar theta, com valor inicial 3.6
fit <- mle(neg_log_likelihood, start = list(theta = 3.6))
theta_estimated <- coef(fit)
quantile_estimated <- quantile_function(p, theta_estimated, a)
quantile_true <- quantile_function(p, 3.6, a)

absolute_deviation <- abs(quantile_estimated - quantile_true)
print(paste("Desvio absoluto:", round(absolute_deviation, 4))) #0.3342
