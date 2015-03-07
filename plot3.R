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

png("Plot3.png", width=480, height=480, bg="transparent")
# create 3 overlayed time series
plot(data$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, 
       col=c("black", "red", "blue"))
axis(1,at=at,labels=xlabels)
dev.off()