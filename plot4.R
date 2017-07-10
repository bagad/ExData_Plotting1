

## Peer graded assignment#1 of plot4 for Exploratory Data Analysis

##Read source data
Source_Data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##extract data for 2days of Feb 2007
Required_Data <- subset(Source_Data,Source_Data$Date=="1/2/2007" | Source_Data$Date =="2/2/2007")


## convert required data for graphics in numeric
## eg. Global Active Power must be in numeric in order to draw graphics
GlobalActivePower <- as.numeric(Required_Data$Global_active_power)
Sub_metering_1 <- as.numeric(Required_Data$Sub_metering_1)
Sub_metering_2 <- as.numeric(Required_Data$Sub_metering_2)
Sub_metering_3 <- as.numeric(Required_Data$Sub_metering_3)
GlobalReactivePower <- as.numeric(Required_Data$Global_reactive_power)
Voltage <- as.numeric(Required_Data$Voltage)

#get date and time concatenated and convert them
SourceDateTime <- paste(Required_Data$Date, Required_Data$Time, sep=" ")
DatetimeData <- strptime(SourceDateTime, "%d/%m/%Y %H:%M:%S") 

## To save the graph in PNG file with a width of 480 pixels and a height of 480 pixels
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot graphs
plot(DatetimeData, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")


plot(DatetimeData, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DatetimeData, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(DatetimeData, Sub_metering_1, type="l", col="red")
lines(DatetimeData, Sub_metering_1, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="o")

#plot graph datetime vs Global Reactive Power
plot(DatetimeData, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()