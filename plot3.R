
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
png(file="plot3.png", width=480, height=480)
plot(subdata$fulltime, subdata$Sub_metering_1, type ="l", 
     ylab="Energy sub metering", xlab="")
lines(subdata$fulltime, subdata$Sub_metering_2, col="red")
lines(subdata$fulltime, subdata$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col=c("black","blue","red"),legend = colnames(subdata)[7:9])
dev.off()
