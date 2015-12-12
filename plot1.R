# First read in the data and select only the rows requested in the assignment.
# For all the *nix-based machines,  the following is a fast way to do this.
energy <- read.table(pipe("grep '^[12]/2/2007\\|^Date;' household_power_consumption.txt"),
                     sep=";", na.strings = "?", header = TRUE,
                     stringsAsFactors=FALSE)

# On a Windows machine, I would read in the whole file and select the specified rows
# There are no doubt more elegant and cross platform ways, but this is how I'd do it for now.
# (Commented out since I run on a Mac)
# Also, the rubric states that we are not to run the code,  just look and see if it should work.

# energy1 <- read.table("household_power_consumption.txt",sep=";", na.strings="?",
# header=TRUE, stringsAsFactors=FALSE)
# energy <- energy1[which(energy$Date == "1/2/2007" | energy$Date == "2/2/2007"),]

# Code to create the histogram is a straightforward call to hist()
# The default parameters for png match what is requested in the assignment

png(file="plot1.png")
hist(energy$Global_active_power, col='red', main='Global Active Power', xlab= 'Global Active Power (kilowatts)')
dev.off()