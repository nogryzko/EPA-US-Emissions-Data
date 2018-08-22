NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

balt <- subset(NEI, NEI$fips == "24510")

motor <- grep("On-Road", SCC$EI.Sector) ## select motor sources

SCC_motor <- as.character(SCC$SCC[motor]) ##find motor SCCs

balt_motor <- balt[balt$SCC %in% SCC_motor, ]

a <- aggregate(balt_motor$Emissions, by=list(Category=balt_motor$year), FUN=sum)

png(filename = "plot5.png", width = 480, height = 480, units = "px")

plot(a$Category, a$x, type = "l", ylab = "PM2.5 Emissions (tons)", xlab = "Year", main = "Total PM2.5 Emissions from Motor vehicles", sub = "Baltimore, Maryland")

dev.off()