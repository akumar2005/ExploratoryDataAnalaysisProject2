# Load NEI and SCC data frames 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

# Use Aggregate function to get the total emissions from PM2.5 by year
TotalEmissions <- aggregate(Emissions ~ year, NEI, sum)

#Plot distribution of total emissions as a function of year

png("plot1.png",width=480,height=480)
plot(TotalEmissions$year,TotalEmissions$Emissions/10^6, type="l",
     xlab = "Year", ylab = "Total PM2.5 Emissions (10^6 Tons)", 
     main = "Total US PM2.5 Emissions by year")
dev.off()

# Ans: The emissions sharply declined from 1999 to 2002,
# then a slower decline between 2002 and 2005,
# again sharply declined from 2005 to 2008.