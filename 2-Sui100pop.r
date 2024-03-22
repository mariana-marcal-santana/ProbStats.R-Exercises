library(ggplot2)

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/master.csv'
data <- read.csv(url)
data <- subset(data, year == 1986 & age == "25-34 years")

sexes <- c("female", "male")
