# Load NEI and SCC data frames 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 
#1999 - 2008 in Baltimore City?

#Subset of Emission data for Baltimore city and for
# Motor vehicles

BaltiEmissions <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

# Find total emissions by year 
BaltiEmissionsAggr <- aggregate(Emissions ~ year, BaltiEmissions, sum)

#Plot distribution of total vehicle emissions as a function of year 
# for Baltimore City

library(ggplot2)

png("plot5.png",width=480,height=480)
p <- ggplot(BaltiEmissionsAggr, aes(x=year, y=Emissions)) +
        geom_smooth( method="loess") +
        ggtitle("Total Motor Vehicle Emissions by year in Baltimore City")

print(p)
dev.off()

# Ans: Total vehicle PM2.5 emissions decreased sharply till 2002.
# There was almost no appreciable change till 2005.
# From 2005 to 2008, the emissions showed a decrease.