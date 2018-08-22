library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds") ##skip this if already read in.

balt <- subset(NEI, NEI$fips == "24510")

a <- aggregate(balt$Emissions ~ balt$type + balt$year, balt, FUN = sum)

colnames(a) <- c("type", "year", "Emissions")

b <- a[1:4,]

png(filename = "plot3.png", width = 480, height = 480, units = "px")

ggplot(a, aes(year, Emissions, group = type, color = type)) + 
        geom_line(size = 1.5) + 
        geom_point(size = 3) + 
        scale_x_continuous(name = "Year", breaks = unique(a$year))+ggtitle("Baltimore Emissions by source") + 
        theme(plot.title = element_text(hjust = 0.5)) +
        ylab("Emissions (tons)") +
        geom_hline(aes(yintercept = Emissions, color = type), b, size = 1.5, lty = 3)

dev.off()

                                                                                                             