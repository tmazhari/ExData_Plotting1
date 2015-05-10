# Getting data and reading it into pwrconsData data frame 
filePath <- "./data/ExploDA/household_power_consumption.txt"
pwrconsData <- read.table(filePath, sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".")

# Data for first two days of February are pulled out from pwrconsData and put into pwrData data frame  
pwrData <- pwrconsData[pwrconsData$Date %in% c("1/2/2007","2/2/2007") ,]

# Date and Time variables are converted to POSIXlt class using strptime function 
dateAndTime <- strptime(paste(pwrData$Date, pwrData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(pwrData$Global_active_power)

# Plot 2
png("plot2.png", width=480, height=480)
plot(dateAndTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
