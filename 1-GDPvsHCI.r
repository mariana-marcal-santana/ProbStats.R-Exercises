library(ggplot2)

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/LE%20vs%20GDP.csv'
data <- read.csv(url, check.names = FALSE)
continents <- c("Asia", "Africa")
