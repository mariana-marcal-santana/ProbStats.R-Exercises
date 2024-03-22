
library(ggplot2)
theme_set(theme_gray())

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv'
data <- read.csv(url, check.names = FALSE)
continents <- c("Asia", "Africa")
countries <- c("United Arab Emirates", "Nepal", "Comoros", "Namibia")

data_subset <- data[data$Continent %in% continents & data$Country %in% countries,]

data |>
  subset(Continent %in% continents) |>
  ggplot() +
  geom_point(aes(`GDP`, `HCI`, color = Continent)) +
  scale_x_log10() +
  labs(title = paste("Life expectancy vs GDP per capita in"),
       x = "GDP per capita (international dollars)",
       y = "HCI (0-1) data from 2020")
  subset(Country %in% countries) |>
  geom_text()

