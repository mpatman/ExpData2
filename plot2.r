library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


BaltimoreCity <- subset(NEI, fips == "24510")

totalPM25ByYear <- tapply(BaltimoreCity$Emissions, BaltimoreCity$year, sum)

png("plot2.png", width=480, height=480)

plot(names(totalPM25ByYear), totalPM25ByYear, type = "l", xlab = "Year", 
     ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main = expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()