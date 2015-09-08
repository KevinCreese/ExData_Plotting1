## Set Working directory
if(getwd() != "C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption") 
  { setwd("C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")}
MyFile <- "household_power_consumption.txt"

## Getting dataset
dataset <- read.table(MyFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")


## Subset data to review two days
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Converting date and time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot 1 - view for accuracy
par(mfrow = c(1, 1)) 
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

