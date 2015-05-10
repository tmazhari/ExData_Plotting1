# Getting data and reading it into pwrconsData data frame 
filePath <- "./data/ExploDA/household_power_consumption.txt"
pwrconsData <- read.table(filePath, sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

# Data for first two days of February are pulled out from pwrconsData and put into pwrData data frame  
pwrData <- pwrconsData[pwrconsData$Date %in% c("1/2/2007","2/2/2007") ,]

# Date and Time variables are converted to POSIXlt class using strptime function. Also, subMetering variables read from data frame and put into separate R objects
dateAndTime <- strptime(paste(pwrData$Date, pwrData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(pwrData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Plot 3
png("plot3.png", width=480, height=480)
plot(dateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateAndTime, subMetering2, type="l", col="red")
lines(dateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()


