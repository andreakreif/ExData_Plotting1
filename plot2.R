## Plot2.R
## Andrea Reif 11/7/2015
## Exploratory Data Analysis - Course Project 1

##Read in data assuming file is in current directory
fname <- "household_power_consumption.txt"

dat <- read.csv(file=fname, na.strings="?", header=TRUE, sep=";",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

dat <- subset(dat, Date =='1/2/2007' | Date =='2/2/2007')

dat$DateTime <- with(dat,strptime(paste(Date,Time,sep=' '),"%d/%m/%Y %H:%M:%S"))

##Create plot in png file
png(file="plot2.png")
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
axis(side=1,at=dat$Time=="00:00:00")
     
dev.off()