#Store household_power_consumption.txt file path in filePath variable
filePath <- "household_power_consumption.txt"

#Read data from file
#1. Set header=TRUE -> Signifies that file has header
#2. Set sep=";" -> Signifies each column separated by ";"
#3. stringsAsFactors=FALSE -> read data as it is without any  conversions
#4. dec="." -> Decimal separator for numeric values
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Extract data between the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert Global_active_power column data to number and store it in globalActivePower variable
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Initiate device to plot histogram
png("plot1.png", width=480, height=480)

#Plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Turn device off to ensure that histogram is written of on file device
dev.off()

