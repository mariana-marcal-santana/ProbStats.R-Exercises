lambda0 <- 2.90
lambda1 <- 3.15
k <- 3.234
m <- 5000
n <- 100
set.seed(2822)

erro_tipo1 <- 0
erro_tipo2 <- 0

for (i in 1:m) {

  amostra_H0 <- rpois(n, lambda0)
  amostra_H1 <- rpois(n, lambda1)

  media_H0 <- mean(amostra_H0)
  media_H1 <- mean(amostra_H1)
  
  if (media_H0 > k) {
    erro_tipo1 <- erro_tipo1 + 1
  }
  
  if (media_H1 <= k) {
    erro_tipo2 <- erro_tipo2 + 1
  }
}

freq_rel_erro_tipo1 <- erro_tipo1 / m
freq_rel_erro_tipo2 <- erro_tipo2 / m

quociente <- freq_rel_erro_tipo2 / freq_rel_erro_tipo1 # 28.049
