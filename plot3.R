
## Peer graded assignment#1 of plot3 for Exploratory Data Analysis

##Read source data
Source_Data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##extract data for 2days of Feb 2007
Required_Data <- subset(Source_Data,Source_Data$Date=="1/2/2007" | Source_Data$Date =="2/2/2007")

## Global Active Power must be in numeric in order to draw graphics
GlobalActivePower <- as.numeric(Required_Data$Global_active_power)

#get date and time concatenated and convert them
SourceDateTime <- paste(Required_Data$Date, Required_Data$Time, sep=" ")
DatetimeData <- strptime(SourceDateTime, "%d/%m/%Y %H:%M:%S") 

## read data from sub metering 1,2,3 fields and convert them in numeric in order to draw graphics
Sub_metering_1 <- as.numeric(Required_Data$Sub_metering_1)
Sub_metering_2 <- as.numeric(Required_Data$Sub_metering_2)
Sub_metering_3 <- as.numeric(Required_Data$Sub_metering_3)

## To save the graph in PNG file with a width of 480 pixels and a height of 480 pixels
png("plot3.png", width=480, height=480)

## draw graphics with x axis as converted datetime and y as metering 1,2,3 data with arguments type l for line and col for color to differentiate data
plot(DatetimeData, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(DatetimeData, Sub_metering_2, type="l", col="red")
lines(DatetimeData, Sub_metering_3, type="l", col="blue")

## put legend details on top right
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()