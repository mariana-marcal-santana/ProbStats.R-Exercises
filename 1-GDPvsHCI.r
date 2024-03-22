library(ggplot2)
theme_set(theme_gray())

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv'
data <- read.csv(url, check.names = FALSE)

continents <- c("Asia", "Africa")
countries <- c("United Arab Emirates", "Nepal", "Comoros", "Namibia")

data_continent <- subset(data, Continent %in% continents)
data_countries <- subset(data, Country %in% countries)

ggplot(data_continent, aes(x = GDP, y = HCI, color = Continent)) +
  geom_point() +
  geom_text(data = data_countries, aes(label = Country), hjust = 0, vjust = 0, size = 3) +
  scale_x_log10() +
  labs(title = "HCI - GDP per capita",
       x = "GDP per capita (international dollars)",
       y = "HCI (0-1) data from 2020")
