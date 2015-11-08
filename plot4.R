## Plot4.R
## Andrea Reif 11/7/2015
## Exploratory Data Analysis - Course Project 1

##Read in data assuming file is in current directory

fname <- "household_power_consumption.txt"

dat <- read.csv(file=fname, na.strings="?", header=TRUE, sep=";",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

dat <- subset(dat, Date =='1/2/2007' | Date =='2/2/2007')

dat$DateTime <- with(dat,strptime(paste(Date,Time,sep=' '),"%d/%m/%Y %H:%M:%S"))

##Create 4 plots as one png file
png(file="plot4.png")
par(mfrow=c(2,2))

##Plot 1
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
axis(side=1,at=dat$Time=="00:00:00")

##Plot 2
plot(dat$DateTime,dat$Voltage,type="l",xlab="datetime", ylab="Voltage")
axis(side=1,at=dat$Time=="00:00:00")

##Plot 3
plot(dat$DateTime,dat$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering", col="black")
lines(dat$DateTime,dat$Sub_metering_2,type="l", col="red")
lines(dat$DateTime,dat$Sub_metering_3,type="l", col="blue")
axis(side=1,at=dat$Time=="00:00:00")
legend("topright",legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black","red","blue"),seg.len=2,lwd=c(1,1,1), lty=c(1,1,1),bty="n")

##Plot 4
plot(dat$DateTime,dat$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")
axis(side=1,at=dat$Time=="00:00:00")

dev.off()