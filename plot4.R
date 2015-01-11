##Loading data
electric_power <- read.table("./household_power_consumption.txt", sep = ";", na.strings = c("?",""), header = TRUE)
data <- subset(electric_power, electric_power$Date == "1/2/2007" | electric_power$Date == "2/2/2007")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 1, 3, 1))

## Plot 1
plot(data$DateTime, data$Global_active_power, cex.lab=0.75, cex.axis = 0.75, type="n", main = "", xlab ="", ylab = "Global Active Power")
lines(data$DateTime,data$Global_active_power)

## Plot 2
plot(data$DateTime, data$Sub_metering_1, cex.lab=0.75, cex.axis = 0.75, type="n", main = "", xlab ="", ylab = "Energy sub metering")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2, col = "red")
lines(data$DateTime,data$Sub_metering_3, col = "blue")
legend("topright", cex=0.25, pch = "", lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 3
plot(data$DateTime, data$Voltage, cex.lab=0.75, cex.axis = 0.75, type="n", main = "", xlab ="datetime", ylab = "Voltage")
lines(data$DateTime,data$Voltage)

## plot 4
plot(data$DateTime, data$Global_reactive_power, cex.lab=0.75, cex.axis = 0.75, type="n", main = "", xlab ="datetime", ylab = "Global_reactive_power")
lines(data$DateTime,data$Global_reactive_power)

## Wrinting the plot file
dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()
