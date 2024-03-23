library(ggplot2)

data <- readxl::read_xlsx("electricity.xlsx")
data <- subset(data, YEAR >= 2015 & PRODUCT == "Renewables")
data$share <- as.numeric(data$share) * 100 # 0-1 -> 0-100

countries <- c("IEA Total", "Italy", "Latvia")
