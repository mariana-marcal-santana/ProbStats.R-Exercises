
a <- 4
n_samples <- 1000
n <- 40

set.seed(1973)

exact_value <- 1 - pgamma(126, shape = 40, rate = 1/4) # 1 - P(Y <= 126)

#amostras <- 

#amostras <- matrix(rexp(n_samples, rate = 1/4), nrow = n)

amostras <- replicate(1000, rexp(n, 1/4))

somas <- colSums(amostras)

prob_y_maior <- sum(somas > 126) / length(somas)



prob_maior_126 <- mean(somas > 126)

result <- round(abs(exact_value - prob_y_maior) * 100, 4) # 0.6141


#########################################

a <- 4
n_samples <- 1000
n <- 40

set.seed(1973)

exact_value <- 1 - pgamma(126, shape = 40, rate = 1/4) # 1 - P(Y <= 126)

amostras <- matrix(rexp(n_samples * n, rate = 1/4), nrow = n_samples)

somas <- rowSums(amostras)

prob_maior_126 <- mean(somas > 126)

result <- round(abs(exact_value - prob_maior_126) * 100, 4) # 0.6141
