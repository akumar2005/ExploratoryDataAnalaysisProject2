# Load NEI and SCC data frames 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from
# 1999 to 2008?

# Find Subset of NEI data for Baltimore
BaltiEmissions <- NEI[NEI$fips=="24510",]

# Find total emissions by year for Baltimore
BaltiEmissionsAggr <- aggregate(Emissions ~ year, BaltiEmissions, sum)

#Plot distribution of total emissions as a function of year

png("plot2.png",width=480,height=480)
plot(BaltiEmissionsAggr$year,BaltiEmissionsAggr$Emissions, type="l",
     xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", 
     main = "Baltimore City PM2.5 Emissions by year")
dev.off()

# Ans: The data indicate a sharp decline between 1999 and 2002,
# a sharp increase from 2002 to 2005 and finally, another sharp 
# decrease from 2005 to 2008.