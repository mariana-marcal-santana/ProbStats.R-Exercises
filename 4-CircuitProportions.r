n <- 150
set.seed(2255)

nao_deslig <- 0
som_nao_deslig <- 0

for(i in 1:n) {
  
  sinais <- sample(1:10, size = 9, replace = TRUE, prob = (1:10)/55)

  som <- any(sinais == 2)
  deslig <- any(sinais == 1)
  
  if (!deslig) nao_deslig = nao_deslig + 1
  if (som & !deslig) som_nao_deslig <- som_nao_deslig + 1
}

prop <- som_nao_deslig/nao_deslig # 0.325
