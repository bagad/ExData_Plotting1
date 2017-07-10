

## Peer graded assignment#1 of plot1 for Exploratory Data Analysis

##Read source data
Source_Data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##extract data for 2days of Feb 2007
Required_Data <- subset(Source_Data,Source_Data$Date=="1/2/2007" | Source_Data$Date =="2/2/2007")

## Global Active Power must be in numeric in order to draw graphics
GlobalActivePower <- as.numeric(Required_Data$Global_active_power)
## To save the graph in PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480)

## draw graphics
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()