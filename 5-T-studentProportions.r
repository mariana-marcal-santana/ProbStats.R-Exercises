n <- 23
r <- 300
m <- 170

set.seed(1950)

p <- pt(1.5, df = n) # t-student distribution with n degrees of freedom up to 1.5

prop_samples <- numeric(r) # numeric vector with r spaces

for (i in 1:r) {
  
  Zs <- rnorm(n + 1) # n+1 random numbers from a normal distribution (from 1 to n+1)
  
  T <- sqrt(n) * Zs[1] / sqrt(sum(Zs[-1]^2)) # t-student distribution
  
  prop_samples[i] <- mean(T <= 1.5) # calculates the mean of the t-student distribution's values if they´re less than 1.5
}

mean_prop_samples <- mean(prop_samples) # mean of the prop_samples vector

dif <- abs(mean_prop_samples - p) # difference between the mean of the prop_samples vector and the p value

result <- round(dif * 100, 5) # 2.36087
