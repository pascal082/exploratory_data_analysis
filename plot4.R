#plot4
data <- read.table("data.txt",header=T,sep=";")

#convert data variables to as.Date
data$newDate <- as.Date(data$Date,"%d/%m/%Y")


#subset a data by retriving data with dates 2007-02-01 and 2007-02-02.

subdata <- subset(data, newDate == "2007-02-01" | newDate == "2007-02-02")
#converting time variable to time format
subdata$newTime <- strptime(subdata$Time,"%H:%M:%S")
#combine date and time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <-  strptime(subdata$DateTime , "%d/%m/%Y %H:%M:%S")

subdata$Sub_metering_1 <- as.character(subdata$Sub_metering_1)
subdata$Sub_metering_1[subdata$Sub_metering_1=="?"] <-NA
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))

subdata$Sub_metering_2 <- as.character(subdata$Sub_metering_2)
subdata$Sub_metering_2[subdata$Sub_metering_2=="?"] <-NA
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))

subdata$Sub_metering_3 <- as.character(subdata$Sub_metering_3)
subdata$Sub_metering_3[subdata$Sub_metering_3=="?"] <-NA
subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))


plot(subdata$DateTime , subdata$Sub_metering_1,type="n",ylab="Energy Sub Metering")
lines(subdata$DateTime ,subdata$Sub_metering_1, col="black")
lines(subdata$DateTime ,subdata$Sub_metering_2, col="red")
lines(subdata$DateTime ,subdata$Sub_metering_3, col="blue")


subdata$Global_active_power[subdata$Global_active_power=="?"] <- NA
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

subdata$Voltage[subdata$Voltage=="?"] <- NA
subdata$Voltage <- as.numeric(as.character(subdata$Voltage))

subdata$Global_reactive_power[subdata$Global_reactive_power=="?"] <- NA
subdata$Global_reactive_power <- as.numeric(as.character(subdata$Global_reactive_power))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(subdata$DateTime ,subdata$Global_active_power,type="n",ylab="Global Active Power (kilowatts)")
lines(subdata$DateTime ,subdata$Global_active_power)

plot(subdata$DateTime ,subdata$Voltage,type="n",ylab="Voltage")
lines(subdata$DateTime ,subdata$Voltage)


plot(subdata$DateTime , subdata$Sub_metering_1,type="n",ylab="Energy Sub Metering")
lines(subdata$DateTime ,subdata$Sub_metering_1, col="black")
lines(subdata$DateTime ,subdata$Sub_metering_2, col="red")
lines(subdata$DateTime ,subdata$Sub_metering_3, col="blue")

plot(subdata$DateTime ,subdata$Global_reactive_power,type="n",ylab="Global reactive power")
lines(subdata$DateTime ,subdata$Global_reactive_power)

