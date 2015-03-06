setwd("~/Coursera/R/ExpDataAnalysis")

# read the data to a file, and convert the date
x = read.table("household_power_consumption.txt",na.strings="?", sep= ";", header = TRUE)
x$Date <- as.Date(as.character(x$Date),"%d/%m/%Y")

# subset the data
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date <= as.Date("2007-02-02")),]


png(filename = "plot1.png", width = 480, height = 480, units = "px")

# plot the histagram
hist(y$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()
