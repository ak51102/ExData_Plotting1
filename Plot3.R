#Store household_power_consumption.txt file path in filePath variable
filePath <- "./Data/household_power_consumption.txt"

#Read data from file
#1. Set header=TRUE -> Signifies that file has header
#2. Set sep=";" -> Signifies each column separated by ";"
#3. stringsAsFactors=FALSE -> read data as it is without any  conversions
#4. dec="." -> Decimal separator for numeric values
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Extract data between the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert Global_active_power/subMetering1-2-3 column data to number and store it in respective variable
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#Initiate device to plot diagram
png("plot3.png", width=480, height=480)

#Plot graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Turn device off to ensure that histogram is written of on file device
dev.off()

