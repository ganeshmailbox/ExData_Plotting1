data <-read.table("household_power_consumption.txt", sep=";", colClasses = c("factor","factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header=TRUE, na.strings = "?")
str(data)
dataSet <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 
dataSet$datetime<-as.POSIXct(paste(dataSet$Date,dataSet$Time), format="%d/%m/%Y %H:%M:%S")

hist(dataSet$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#plot(data$datetime,data$power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
