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
