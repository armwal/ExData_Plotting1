# assuming that the data file is in the same directory...
data <- read.csv('household_power_consumption.txt',sep = ";",na.strings="?")
idx <- which(as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007")
data <- data[idx,]

png("Plot1.png", width=480, height=480, bg="transparent")
# create histogram
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()