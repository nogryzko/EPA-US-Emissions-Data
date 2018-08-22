NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

motor <- grep("On-Road", SCC$EI.Sector) ## select motor sources

SCC_motor <- as.character(SCC$SCC[motor]) ##find motor SCCs

balt <- subset(NEI, NEI$fips == "24510")

LA <- subset(NEI, NEI$fips == "06037")

balt_motor <- balt[balt$SCC %in% SCC_motor, ]

LA_motor <- LA[LA$SCC %in% SCC_motor, ]

b <- aggregate(balt_motor$Emissions, by=list(Category=balt_motor$year), FUN=sum)

b$N <- b$x/b$x[1]

l <- aggregate(LA_motor$Emissions, by=list(Category=LA_motor$year), FUN=sum)

l$N <- l$x/l$x[1]


png(filename = "plot6.png", width = 480, height = 480, units = "px")

plot(b$Category, b$N, type = "b", ylab = "Normalised PM2.5 Emissions (1999 = 1)", xlab = "Year", main = "Total PM2.5 Emissions from Motor vehicles", col = "blue", ylim = c(0.3, 1.2))

points(l$Category, l$N, type = "b", col = "orange")

legend("right", legend = c("Baltimore", "LA"), col = c("blue", "orange"), lty = 1, xpd = TRUE, bty = 'n')

abline(h = 1, lty = 2)

dev.off()