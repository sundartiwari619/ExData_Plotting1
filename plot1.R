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
hist(myDS$Global_active_power, col="red", breaks=15, main="Global Active Power", xlab="Global Active Power (kilowatts)")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(myDS$Global_active_power, col="red", breaks=15, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
