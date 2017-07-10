
## Peer graded assignment#1 of plot2 for Exploratory Data Analysis

##Read source data
Source_Data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##extract data for 2days of Feb 2007
Required_Data <- subset(Source_Data,Source_Data$Date=="1/2/2007" | Source_Data$Date =="2/2/2007")

## Global Active Power must be in numeric in order to draw graphics
GlobalActivePower <- as.numeric(Required_Data$Global_active_power)

##get date and time concatenated and convert them
SourceDateTime <- paste(Required_Data$Date, Required_Data$Time, sep=" ")
DatetimeData <- strptime(SourceDateTime, "%d/%m/%Y %H:%M:%S") 

## To save the graph in PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width=480, height=480)
## draw graphics
plot(DatetimeData, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
