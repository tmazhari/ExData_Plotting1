# Getting data and reading it into pwrconsData data frame 
filePath <- "./data/ExploDA/household_power_consumption.txt"
pwrconsData <- read.table(filePath, sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

# Data for first two days of February are pulled out from pwrconsData and put into pwrData data frame  
pwrData <- pwrconsData[pwrconsData$Date %in% c("1/2/2007","2/2/2007") ,]

# Date and Time variables are converted to POSIXlt class using strptime function. Also, subMetering, Global Active and Reactive Power and Voltage variables read from data frame and put into separate R objects. 
dateAndTime <- strptime(paste(pwrData$Date, pwrData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(pwrData$Global_active_power)
globalReactivePower <- as.numeric(pwrData$Global_reactive_power)
voltage <- as.numeric(pwrData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Plot 3
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Plot Top Left
plot(dateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot Top Right
plot(dateAndTime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot Bottom Left
plot(dateAndTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateAndTime, subMetering2, type="l", col="red")
lines(dateAndTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot Bottom Right
plot(dateAndTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
