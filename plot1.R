
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
png(file="plot1.png", width=480, height=480)
hist(subdata$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
dev.off()

  

