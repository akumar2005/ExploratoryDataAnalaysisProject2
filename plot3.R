# Load NEI and SCC data frames 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008?

# Find Subset of NEI data for Baltimore
BaltiEmissions <- NEI[NEI$fips=="24510",]

# Find total emissions by year and type for Baltimore
BaltiEmissionsAggr <- aggregate(Emissions ~ year+type, BaltiEmissions, sum)

#Plot distribution of total emissions as a function of year 
# for different sources

library(ggplot2)

png("plot3.png",width=480,height=480)
p <- ggplot(BaltiEmissionsAggr, aes(x=year, y=Emissions, colour=type)) +
        geom_smooth( method="loess") +
        ggtitle("Total Emissions by Source Type in Baltimore City")

print(p)
dev.off()

# Ans: The data indicate that emissions from source types nonpoint, onroad, and
# nonroad decreased during the period 1999-2008. 
# Emissions from source type point slightly increased from 1999 to 2002,
# sharply increased from 2002 to 2005 and then sharply decreased.