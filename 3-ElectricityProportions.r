library(readxl)
library(ggplot2)

data <- readxl::read_xlsx("electricity.xlsx")
data <- subset(data, YEAR >= 2015 & COUNTRY %in% c("IEA Total", "Italy", "Latvia") & PRODUCT == "Renewables")

data$share <- as.numeric(data$share)
data$DATE <- as.Date(paste(data$YEAR, data$MONTH, '01', sep="-"))

ggplot(data, aes(x = DATE, y = share, color = COUNTRY)) +
  geom_line(size = 0.75) +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(title = "Monthly Proportion of Renewable Energy Production (2015-2022)",
       x = "Months",
       y = "Renewable Energy Proportion (%)")
