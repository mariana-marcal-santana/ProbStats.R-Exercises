circuits <- 9
seed <- 2255
n <- 150

sound_alert_not_off <- 0

set.seed(seed)

probabilities <- 1:10 / 55 # array 1/55, 2/55, ..., 10/50

for (i in 1:n) {
  results <- sample(1:10, circuits, replace = TRUE, prob = probabilities)
  if (2%in%results & !1%in%results) { 
    sound_alert_not_off <- sound_alert_not_off + 1 
  }
}

proportion <- sound_alert_not_off/n # 0.26 ????


aviso_sonoro_sem_desligamento <- 0
n_desligamentos <- 0
n <- 150
set.seed(2255)


for(i in 1:n) {
  sinais <- sample(1:10, size = 9, replace = TRUE, prob = (1:10)/55)
  # Verificar condições para aviso sonoro e desligamento
  aviso_sonoro <- any(sinais == 2)
  desligamento <- any(sinais == 1)
  
  if (!desligamento)  n_desligamentos = n_desligamentos + 1
  if (aviso_sonoro & !desligamento) {
    aviso_sonoro_sem_desligamento <- aviso_sonoro_sem_desligamento + 1
  }
}
prop <- aviso_sonoro_sem_desligamento/n_desligamentos
print(prop)
