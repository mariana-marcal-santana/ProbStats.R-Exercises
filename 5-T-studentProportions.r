n <- 23
r <- 300
m <- 170
set.seed(1950)

samples <- matrix(0, nrow=r, ncol=m)

for (i in 1:r) {
  for (j in 1:m) {
    
    Z <- rnorm(n + 1)
    T <- sqrt(n) * Z[1] / sqrt(sum(Z[-1]^2))
    samples[i, j] <- T
    
  }
}

proportions <- rowMeans(samples <= 1.5)
aprox_prob <- mean(proportions)

exact_prob <- pt(1.5, df=n)

result <- round(abs(aprox_prob - exact_prob) * 100, 5) # 0.06266
