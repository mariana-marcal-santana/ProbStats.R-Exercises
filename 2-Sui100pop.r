library(ggplot2)

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/master.csv'
data <- read.csv(url)
data <- subset(data, year == 1986 & age == "25-34 years")

ggplot(data) +
  geom_boxplot(aes(sex, suicides.100k.pop)) +
  labs(title = paste0("Nº of suicides in 100k habitants per Sex (1986/25-34 years)"), 
       y = "Nº of suicides in 100k habitants", x = "Sex") +
  theme(plot.title = element_text(hjust = 0.5))
