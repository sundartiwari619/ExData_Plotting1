# setwd("")
# Load data
myDS <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
# convert dates and times
myDS$DateTime <- as.POSIXct (strptime(paste(myDS$Date, myDS$Time), format="%d/%m/%Y %H:%M:%S"))
# subset relevant dates (2007-02-01 and 2007-02-02)
myDS <- subset(myDS, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))
#recode variables
myDS$Date <- as.Date(strptime(myDS$Date, "%d/%m/%Y"))
myDS[,3] <- as.numeric(as.character(myDS[,3]))
myDS[,4] <- as.numeric(as.character(myDS[,4]))
myDS[,5] <- as.numeric(as.character(myDS[,5]))
myDS[,6] <- as.numeric(as.character(myDS[,6]))
myDS[,7] <- as.numeric(as.character(myDS[,7]))
myDS[,8] <- as.numeric(as.character(myDS[,8]))
myDS[,9] <- as.numeric(as.character(myDS[,9]))


# recode missings


# create diagram
par(mfrow=c(2,2))
plot(myDS$DateTime, myDS$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(myDS$DateTime, myDS$Voltage, type="l", xlab="datetime", ylab = "Voltage")
plot(x=myDS$DateTime, y= myDS$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=myDS$DateTime, y= myDS$Sub_metering_2, type="l", col="red")
lines(x=myDS$DateTime, y= myDS$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lwd=1, lty=1)
plot(x=myDS$DateTime, y= myDS$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(myDS$DateTime, myDS$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(myDS$DateTime, myDS$Voltage, type="l", xlab="datetime", ylab = "Voltage")
plot(x=myDS$DateTime, y= myDS$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=myDS$DateTime, y= myDS$Sub_metering_2, type="l", col="red")
lines(x=myDS$DateTime, y= myDS$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), lwd=1, lty=1)
plot(x=myDS$DateTime, y= myDS$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
