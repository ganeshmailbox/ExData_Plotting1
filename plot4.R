## Load the Data and date time column
data <-read.table("household_power_consumption.txt", sep=";", colClasses = c("factor","factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header=TRUE, na.strings = "?")
str(dataSet)
dataSet <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 
dataSet$datetime<-as.POSIXct(paste(dataSet$Date,dataSet$Time), format="%d/%m/%Y %H:%M:%S")

## Create and write the X-Y plot and combine other plots
png("plot4.png")
par(mfrow=c(2,2), mar =c(2,2,2,2))
plot(dataSet$datetime,dataSet$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
plot(dataSet$datetime,dataSet$Voltage,type="l",xlab="", ylab="Voltage")
plot(dataSet$datetime,dataSet$Sub_metering_1,type="l",xlab=" ",ylab="Energy Sub Metering",ylim=c(0,40))
lines(dataSet$datetime,y=dataSet$Sub_metering_2,ylim=c(0,40),col="red")
lines(dataSet$datetime,y=dataSet$Sub_metering_3,ylim=c(0,40),col="blue")
legend("topright", cex=0.95, bty="n", col = c("black", "red", "blue"), lty = c("solid", "solid", "solid"), legend = names(dataSet[,7:9]))
plot(dataSet$datetime,dataSet$Global_reactive_power,type="l",xlab="", ylab="Global_reactive_power")

dev.off()
