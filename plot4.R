#plot4.R

unzip("exdata-data-household_power_consumption.zip")
dataSet <- read.table(file = "household_power_consumption.txt", 
                      na.strings = c("?", ""), sep = ";", header=TRUE)
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")  
dataSet$timetemp <- paste(dataSet$Date, dataSet$Time)
dataSet$Time <- strptime(dataSet$timetemp, format = "%Y-%m-%d %H:%M:%S")
data <- dataSet[dataSet$Date == "2007-02-01" | dataSet$Date == "2007-02-02",]

png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(data$Time, data$Global_active_power,
     type="l", xlab="", ylab="Global Active Power")

plot(data$Time, data$Voltage,
     type="l", xlab="datetime", ylab="Voltage")

plot(data$Time, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"))

plot(data$Time, data$Global_reactive_power,
     type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()