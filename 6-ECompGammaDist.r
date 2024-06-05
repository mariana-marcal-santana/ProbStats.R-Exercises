a <- 4
n <- 40
n_samples <- 1000
set.seed(1973)

exact_value <- 1 - pgamma(126, shape = n, rate = 1/a) # 1 - P(Y <= 126)

amostras <- replicate(n_samples, rexp(n, 1/a))

somas <- colSums(amostras)
prob_maior_126 <- mean(somas > 126)

result <- round(abs(exact_value - prob_maior_126) * 100, 4) # 0.1859
