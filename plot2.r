## Set Working directory
if(getwd() != "C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption") 
{ setwd("C:/Users/kevincre/Desktop/Projects/Data Science Certificate/4-ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")}
MyFile <- "household_power_consumption.txt"

data <- read.table(MyFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
df <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

par(mfrow = c(1, 1)) 

# Convert the date and time so it can be graphed
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Format the Global Active Power into a number
globalActivePower <- as.numeric(df$Global_active_power)

# build the plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
