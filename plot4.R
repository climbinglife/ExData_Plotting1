rm(list=ls())
#Set Working directory
setwd("C:/Coursera/exploratory")

#Load the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Convert date
data$fulltime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Get the data on specific dates
idx <- which(data$fulltime>="2007-02-01 00:00:00" & data$fulltime<"2007-02-03 00:00:00") 
subdata <- data[idx,]

# Plot histogram of global active power
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(subdata, {
  #subplot 1
  plot(subdata$fulltime, subdata$Global_active_power, type ="l", ylab="Global Active Power (kilowatts)", xlab="")
  #subplot 2
  plot(subdata$fulltime, subdata$Voltage, type ="l", ylab="Voltage", xlab="datetime")
  #subplot 3
  plot(subdata$fulltime, subdata$Sub_metering_1, type ="l", 
       ylab="Energy sub metering", xlab="")
  lines(subdata$fulltime, subdata$Sub_metering_2, col="red")
  lines(subdata$fulltime, subdata$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1), col=c("black","blue","red"),legend = colnames(subdata)[7:9], 
         bty="n")
  #subplot 4
  plot(subdata$fulltime, subdata$Global_reactive_power, type ="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()



