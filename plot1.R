## Plot1.R
## Andrea Reif 11/7/2015
## Exploratory Data Analysis - Course Project 1

##Read in data assuming file is in current directory
fname <- "household_power_consumption.txt"

dat <- read.csv(file=fname, na.strings="?", header=TRUE, sep=";",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

dat <- subset(dat, Date =='1/2/2007' | Date =='2/2/2007')

##Create plot in png file
png(file="plot1.png")
hist(dat$Global_active_power, col="orangered1", main ="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()