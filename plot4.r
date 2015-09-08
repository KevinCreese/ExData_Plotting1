## Set Working directory
if(getwd() != "C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption") 
{ setwd("C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")}
MyFile <- "household_power_consumption.txt"

## Getting dataset
dev.off()
dataset <- read.table(MyFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

## Subset data to review two days
df <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(df$Global_active_power)
globalReactivePower <- as.numeric(df$Global_reactive_power)
voltage <- as.numeric(df$Voltage)
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)


## png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o", cex=.75)

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
dev.off()
