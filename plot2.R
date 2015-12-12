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

# First read in the data and select only the rows requested in the assignment.
# For all the *nix-based machines,  the following is a fast way to do this.
# Windows users would have to use the code I put in comments in plot1.R

energy <- read.table(pipe("grep '^[12]/2/2007\\|^Date;' household_power_consumption.txt"),
                   sep=";", na.strings = "?", header = TRUE,
                   stringsAsFactors=FALSE)

## Use lubridate functions to transform Date and Time into a 
##  format that can be concatenated to create a date-time variable 
##  to make the graphs look like those presented in the assignment.

date1 <- dmy(energy$Date)
time1 <- hms(energy$Time)
datetime <- date1 +time1

## Create the plot in a PNG file
png(file="plot2.png")
plot(datetime, energy$Global_active_power, type='l', ylab= 'Global Active Power (kilowatts)', xlab="")
dev.off()
