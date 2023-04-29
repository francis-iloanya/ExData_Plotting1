# Downloaded, Subset, Converted Data 

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ss_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] %>% 
        mutate(DateTime = paste(Date, Time))
ss_data[['DateTime']] <- strptime(ss_data[['DateTime']], format="%d/%m/%Y %H:%M:%S", tz = "UTC")

# Plot 4
png(file="plot4.png",
    width=480, height=480)

par(mfrow= c(2,2), mar= c(5,6,6,2))

#1
plot(ss_data$DateTime, ss_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#2
plot(ss_data$DateTime, ss_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#3
plot(ss_data$DateTime, ss_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col="black")
lines(ss_data$DateTime, ss_data$Sub_metering_2, type = 'l', col = "red")
lines(ss_data$DateTime, ss_data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1, bty="n")
#4
plot(ss_data$DateTime, ss_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()