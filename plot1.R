
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

#plot1
str(subdata)
subdata$Global_active_power[subdata$Global_active_power=="?"] <- NA
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
hist(subdata$Global_active_power , col="red", main="Plot 1: Global Active Power",xlab="Global Active Power (kilowatts)")

