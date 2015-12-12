#########################################################
### I found using lubridate package was a particularly 
###  efficient way to work with times and dates.
### This code installs and loads required packages
###  if necessary
#########################################################
if ('lubridate' %in% installed.packages()[,1]) {
  library(lubridate)
} else {
  install.packages("lubridate", dependencies = TRUE)
  library(lubridate) 
}

# First read in the data selecting only the rows requested in the assignment.

energy <- read.table(pipe("grep '^[12]/2/2007\\|^Date;' household_power_consumption.txt"),
                   sep=";", na.strings = "?", header = TRUE,
                   stringsAsFactors=FALSE)

## Use lubridate functions to transform Date and Time into a 
##  format that can be concatenated to create a date-time variable 
##  to make the graphs look like those presented in the assignment.

date1 <- dmy(energy$Date)
time1 <- hms(energy$Time)
datetime <- date1 +time1

## Create the plots with appropriate legend in a PNG file

png(file="plot3.png")
plot(datetime, energy$Sub_metering_1, type='l', ylab= 'Energy sub metering', xlab="")
lines(datetime, energy$Sub_metering_2, col="red")
lines(datetime, energy$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_3","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
dev.off()
