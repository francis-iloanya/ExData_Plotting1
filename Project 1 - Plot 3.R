# Downloaded, Subset, Converted Data 

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ss_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] %>% 
        mutate(DateTime = paste(Date, Time))
ss_data[['DateTime']] <- strptime(ss_data[['DateTime']], format="%d/%m/%Y %H:%M:%S", tz = "UTC")

# Plot 3

png(file="plot3.png",
    width=480, height=480)

plot(ss_data$DateTime, ss_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col="black")
lines(ss_data$DateTime, ss_data$Sub_metering_2, type = 'l', col = "red")
lines(ss_data$DateTime, ss_data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1)

dev.off()