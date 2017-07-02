#Plot 4, 4 plots 
#top left global active power by timeslot 
#top right voltage by timeslot
#bottom left sub metering by timeslot
#bottom right global reactive power by timeslot

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

timeslots <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submet1 <- as.numeric(subset$Sub_metering_1)
submet2 <- as.numeric(subset$Sub_metering_2)
submet3 <- as.numeric(subset$Sub_metering_3)
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)
png("plot4.png", width=480, height=480)
#4 plots
par(mfrow = c(2, 2)) 

plot(timeslots, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(timeslots, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(timeslots, submet1, type="l", ylab="Energy Submetering", xlab="")
lines(timeslots, submet2, type="l", col="red")
lines(timeslots, submet3, type="l", col="blue")

plot(timeslots, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()

  