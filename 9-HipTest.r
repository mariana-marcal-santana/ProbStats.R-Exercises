# Definindo os parâmetros
lambda0 <- 2.90
lambda1 <- 3.15
k <- 3.234
m <- 5000
n <- 100

# Fixando a semente
set.seed(2822)

# Inicializando contadores de erros
erro_tipo1 <- 0
erro_tipo2 <- 0

# Realizando o teste m vezes
for (i in 1:m) {
  # Gerando amostras sob H0 e H1
  amostra_H0 <- rpois(n, lambda0)
  amostra_H1 <- rpois(n, lambda1)
  
  # Calculando as médias das amostras
  media_H0 <- mean(amostra_H0)
  media_H1 <- mean(amostra_H1)
  
  # Verificando se ocorreu um erro de 1ª espécie (rejeitar H0 quando é verdadeira)
  if (media_H0 > k) {
    erro_tipo1 <- erro_tipo1 + 1
  }
  
  # Verificando se ocorreu um erro de 2ª espécie (não rejeitar H0 quando é falsa)
  if (media_H1 <= k) {
    erro_tipo2 <- erro_tipo2 + 1
  }
}

# Calculando as frequências relativas dos erros
freq_rel_erro_tipo1 <- erro_tipo1 / m
freq_rel_erro_tipo2 <- erro_tipo2 / m

# Calculando o quociente entre a probabilidade de erro de 2ª espécie e a probabilidade de erro de 1ª espécie
quociente <- freq_rel_erro_tipo2 / freq_rel_erro_tipo1 # 28.049
