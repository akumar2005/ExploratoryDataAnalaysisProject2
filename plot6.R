# Load NEI and SCC data frames 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California.
# Which city has seen greater changes over time in motor vehicle emissions?

#Subset of Emission data for Baltimore city and Los Angeles County
# from Motor vehicles
BC <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
LA <- NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",]
BC$city<-"Baltimore City"
LA$city<-"Los Angeles City"

#Combine the data from two cities
both<-rbind(BC,LA)

# aggregate of emission data per year for two cities
both.aggr<-aggregate(Emissions~year+city,both,sum)

#Plot distribution of total vehicle emissions as a function of year 
# for two cities

png("plot6.png",width=480,height=480)
p<-qplot(year,Emissions, data=both.aggr, col=city)
print(p)


# Ans: Considerably lower levels of vehicle emissions for Baltimore.
# Baltimore: Decline from 1999 to 2002. Very slow decrease from 2002-2008.
# LA: steady increase till 2005 and then decreases.

# 