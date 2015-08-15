## Set Working directory and file name
if(getwd() != "C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption") 
{ setwd("C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")}
MyFile <- "household_power_consumption.txt"

## Read in data
data <- read.table(MyFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

## Subset data to review two days
df <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# construct data to be plotted
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(df$Global_active_power)
subMetering1 <- as.numeric(df$Sub_metering_1)
subMetering2 <- as.numeric(df$Sub_metering_2)
subMetering3 <- as.numeric(df$Sub_metering_3)



# build initial plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# add line for sub metering 2 in red
lines(datetime, subMetering2, type="l", col="red")
# add line in blue for sub metering 3 in blue
lines(datetime, subMetering3, type="l", col="blue")
# create a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
