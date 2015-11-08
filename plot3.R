## Plot3.R
## Andrea Reif 11/7/2015
## Exploratory Data Analysis - Course Project 1

##Read in data assuming file is in current directory
fname <- "household_power_consumption.txt"

dat <- read.csv(file=fname, na.strings="?", header=TRUE, sep=";",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

dat <- subset(dat, Date =='1/2/2007' | Date =='2/2/2007')

dat$DateTime <- with(dat,strptime(paste(Date,Time,sep=' '),"%d/%m/%Y %H:%M:%S"))

## Create plot png file
png(file="plot3.png")

plot(dat$DateTime,dat$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering", col="black")
lines(dat$DateTime,dat$Sub_metering_2,type="l", col="red")
lines(dat$DateTime,dat$Sub_metering_3,type="l", col="blue")

axis(side=1,at=dat$Time=="00:00:00")

legend("topright",legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black","red","blue"), pch=95)

dev.off()