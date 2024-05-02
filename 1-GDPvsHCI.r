library(ggplot2)

url <- 'https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/Paises_PIB_ICH.csv'
data <- read.csv(url, check.names = FALSE)
continents <- c("Asia", "Africa")
countries <- c("United Arab Emirates", "Nepal", "Comoros", "Namibia")

ggplot(subset(data, Continent %in% continents), aes(x = GDP, y = HCI, color = Continent)) +
  geom_point() +
  geom_point(data = subset(data, Country %in% countries), size = 3) +
  geom_text(data = subset(data, Country %in% countries), aes(label = Country), hjust = 1.1, vjust = -0.5, size = 3.5, show.legend = FALSE) +
  scale_x_log10() +
  labs(title = "Human Capital Index x Gross Domestic Product per capita",
       x = "Gross Domestic Product per capita (international dollars)",
       y = "Human Capital Index in 2020 (0-1)") +
  theme(plot.title = element_text(hjust = 0.5))  
