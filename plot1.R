#plot1.R

unzip("exdata-data-household_power_consumption.zip")
dataSet <- read.table(file = "household_power_consumption.txt", na.strings = c("?", ""), sep = ";", header=TRUE)
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")  
dataSet$timetemp <- paste(dataSet$Date, dataSet$Time)
dataSet$Time <- strptime(dataSet$timetemp, format = "%Y-%m-%d %H:%M:%S")
data <- dataSet[dataSet$Date == "2007-02-01" | dataSet$Date == "2007-02-02",]

png(filename="plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, main = "Global Active Power", 
                col = "red", xlab = "Global Active Power (kilowatts)"))
dev.off()