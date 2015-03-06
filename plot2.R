setwd("~/Coursera/R/ExpDataAnalysis")

# read the data to a file, and convert the date
x = read.table("household_power_consumption.txt",na.strings="?", sep= ";", header = TRUE)

x$DateTime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M") 
x$Date <- as.Date(as.character(x$Date),"%d/%m/%Y")

# subset the data
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date <= as.Date("2007-02-02")),]

png(filename = "plot2.png", width = 480, height = 480, units = "px")

#plot the graph
plot(y$DateTime, y$Global_active_power, type="n", ann=FALSE)
lines(y$DateTime, y$Global_active_power)
title(ylab = "Global Active Power (kilowatts)")

dev.off()