setwd("~/Coursera/R/ExpDataAnalysis")

# read the data to a file, and convert the date
x = read.table("household_power_consumption.txt",na.strings="?", sep= ";", header = TRUE)

x$DateTime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M") 
x$Date <- as.Date(as.character(x$Date),"%d/%m/%Y")

# subset the data
y <- x[(x$Date >= as.Date("2007-02-01") & x$Date <= as.Date("2007-02-02")),]

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))


#top left
plot(y$DateTime, y$Global_active_power, type="n", ann=FALSE)
lines(y$DateTime, y$Global_active_power)
title(ylab = "Global Active Power")


# plot bottom left

plot(y$DateTime, y$Sub_metering_1, type="n", ann=FALSE)
lines(y$DateTime, y$Sub_metering_1, col = "black")
lines(y$DateTime, y$Sub_metering_2, col = "red")
lines(y$DateTime, y$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd=1, bty = "n")
title(ylab = "Energy sub metering")



# top right
plot(y$DateTime, y$Voltage, type = "n", ann = FALSE)
lines(y$DateTime, y$Voltage)
title(ylab = "Voltage", xlab = "datetime")

#bottom right
plot(y$DateTime, y$Global_reactive_power, type = "n", ann = FALSE)
lines(y$DateTime, y$Global_reactive_power)
title(ylab = "Global_reactive_power", xlab = "datetime")



dev.off()