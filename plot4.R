

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

coal <- grep("[Cc]oal", SCC$EI.Sector) ## select coal sources

SCC_coal <- as.character(SCC$SCC[coal]) ##find coal SCCs

NEI_Coal <- NEI[NEI$SCC %in% SCC_coal, ]

a <- aggregate(NEI_Coal$Emissions, by=list(Category=NEI_Coal$year), FUN=sum)

png(filename = "plot4.png", width = 480, height = 480, units = "px")

plot(a$Category, (a$x/1000000), type = "l", ylab = "PM2.5 Emissions (million tons)", xlab = "Year", main = "Total PM2.5 Emissions from Coal Combustion")

dev.off()