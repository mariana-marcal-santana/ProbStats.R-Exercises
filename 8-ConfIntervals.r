library(pracma)

set.seed(1592)
n <- 12
gamma <- 0.96

dists <- c(31.8,31.7,35.2,37.1,31.7,36.1,36.3,33.2,34.3,37.5,30.4,34.6,32.4,31.7,30.2,34.3,35.6,34.9,38.9)
# 1
sample <- sample(dists, size = n, replace = FALSE)

# 2
a <- qchisq((1 - gamma)/2, df = n - 1)
b <- qchisq((1 + gamma)/2, df = n - 1)

var_sample <- var(sample)
confidence_interval <- c((n - 1) * var_sample / b, (n - 1) * var_sample / a)

# 3
eqs <- function(x) {
  cdf_diff <- pchisq(x[2], df = n - 1) - pchisq(x[1], df = n - 1) - gamma
  pdf_diff <- dchisq(x[2], df = n + 3) - dchisq(x[1], df = n + 3)
  return(c(cdf_diff, pdf_diff))
}

sol <- fsolve(f = eqs, x0 = c(a, b))

new_interval <- ((n - 1) * var_sample) / sol[["x"]]

# 4
amp_1 <- abs(confidence_interval[2] - confidence_interval[1])
amp_2 <- abs(new_interval[2] - new_interval[1])

result <- round(amp_1 - amp_2, 3) # 2.276
