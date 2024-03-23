library(ggplot2)

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/master.csv'
data <- read.csv(url)
data <- subset(data, year == 1986 & age == "25-34 years")

#sexes <- c("female", "male")
#data <- subset(data, sex %in% sexes)

ggplot(data) +
  geom_boxplot(aes(sex, suicides.100k.pop)) +
  labs(title = paste0("Nº of suicides 100k habitants (1986/25-34 years)"), 
       y = "Suicides", x = "Sex")
