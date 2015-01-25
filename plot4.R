# Load NEI and SCC data frames 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999 to 2008?

# coal combustion related NEI data
SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]
merge <- merge(x = NEI, y = SCC.coal, by = 'SCC')

# Find total emissions by year from coal combustion-related sources
merge.aggr<-aggregate(Emissions ~ year, merge, sum)


#Plot distribution of emissions as a function of year 

library(ggplot2)
png("plot4.png",width=480,height=480)

p <- ggplot(merge.aggr, aes(x=year, y=Emissions)) +
        geom_smooth( method="loess") +
        ggtitle("Total PM2.5 Emissions from Coal Combustion Sources") 
        
print(p)
dev.off()


# Emissions from coal-combustion related sources show slight decline
# from 1999 to 2002, marginal increase from 2002 to 2005, and sharp decrease 
# afterwards.
