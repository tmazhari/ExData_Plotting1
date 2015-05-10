# Getting data and reading it into pwrconsData data frame 
filePath <- "./data/ExploDA/household_power_consumption.txt"
pwrconsData <- read.table(filePath, sep=";", header=TRUE)

# Variable Date is converted to Date format
y <- as.Date(x, "%d/%m/%Y")
pwrconsData$Date <- as.Date(pwrconsData$Date, "%d/%m/%&Y")

# Data for first two days of February are pulled out from pwrconsData and put into pwrData data frame  
pwrsub1 <- filter(pwrconsData, pwrconsData$Date == "2007-02-01")
pwrsub2 <- filter(pwrconsData, pwrconsData$Date == "2007-02-02")
pwrData <- rbind(pwrsub1, pwrsub2)

# Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(pwrData$Global_active_power), col="red", main="Global Active Power", xlab="Gloabl Active Power (kilowatts)")
dev.off()