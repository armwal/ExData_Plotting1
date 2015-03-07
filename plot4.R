# assuming that the data file is in the same directory...
data <- read.csv('household_power_consumption.txt',sep = ";",na.strings="?")
idx <- which(as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007")
data <- data[idx,]

# store short form week day
data$weekday <- strftime(as.Date(data$Date,"%d/%m/%Y"),"%a")

# store week days for x axis labels
at <- match(unique(data$weekday),data$weekday)
xlabels <- unique(data$weekday)
# add the next day at the end of the axis for prettiness and...reasons..
at <- c(at, length(data$weekday)+1)
xlabels <- c(xlabels, strftime("2007/02/03", "%a"))


png("Plot4.png", width=480, height=480, bg="transparent")

# create a 2-by-2 grid of plots
par(mfrow = c(2,2))

# first plot
plot(data$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1,at=at,labels=xlabels)

# second plot
plot(data$Voltage, type="l", xaxt="n", xlab="datetime", ylab="Voltage")
axis(1,at=at,labels=xlabels)

# third plot
plot(data$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, 
       col=c("black", "red", "blue"), bty="n")
axis(1,at=at,labels=xlabels)

# fourth plot
plot(data$Global_reactive_power, type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(1,at=at,labels=xlabels)
dev.off()