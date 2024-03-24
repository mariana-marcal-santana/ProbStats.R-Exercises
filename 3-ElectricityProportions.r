library(ggplot2)

data <- readxl::read_xlsx("electricity.xlsx")
data <- subset(data, YEAR >= 2015 & PRODUCT == "Renewables")
data$share <- as.numeric(data$share)
#data$TIME <- as.factor(data$TIME)

countries <- c("IEA Total", "Italy", "Latvia")
data <- subset(data, COUNTRY %in% countries)

ggplot(data, aes(x = YEAR, y = share, color = COUNTRY)) +
  geom_line() +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(title = "Monthly Proportion of Renewable Energy Production (2015-2022)",
       x = "Months",
       y = "Renewable Energy Proportion (%)")

