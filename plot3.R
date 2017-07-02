#Plot 3 sub metering 1,2,3 for  1/2/2007 and 2/2/2007   by time slot
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeslots <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submet1 <- as.numeric(subset$Sub_metering_1)
submet2 <- as.numeric(subset$Sub_metering_2)
submet3 <- as.numeric(subset$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(timeslots, submet1, type="l", ylab="Energy Submetering", xlab="")
lines(timeslots, submet2, type="l", col="red")
lines(timeslots, submet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 