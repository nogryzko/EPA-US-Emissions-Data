NEI <- readRDS("summarySCC_PM25.rds") ##skip this if already read in.

a <- aggregate(NEI$Emissions, by=list(Category=NEI$year), FUN=sum)

png(filename = "plot1.png", width = 480, height = 480, units = "px")

plot(a$Category, (a$x/1000000), type = "l", ylab = "PM2.5 Emissions (million tons)", xlab = "Year", main = "Total PM2.5 Emissions")

dev.off()