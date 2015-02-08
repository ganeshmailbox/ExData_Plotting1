df <-read.table("household_power_consumption.txt", sep=";", colClasses = c("factor","factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"), header=TRUE, na.strings = "?")
df.small <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",] 
