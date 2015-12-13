#plot3
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


plot(subdata$DateTime , subdata$Sub_metering_1,type="n",main="plot 3",ylab="Energy Sub Metering")
lines(subdata$DateTime ,subdata$Sub_metering_1, col="black")
lines(subdata$DateTime ,subdata$Sub_metering_2, col="red")
lines(subdata$DateTime ,subdata$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1),  col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
