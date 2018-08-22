NEI <- readRDS("summarySCC_PM25.rds") ##skip this if already read in.

balt <- subset(NEI, NEI$fips == "24510")

a <- aggregate(balt$Emissions, by = list(Category = balt$year), FUN = sum)


png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(a$Category, (a$x/1000), type = "l", ylab = "PM2.5 Emissions (1000 tons)", xlab = "Year", main = "Total PM2.5 Emissions", sub = "Baltimore, Maryland")


dev.off()