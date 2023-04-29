# Downloaded, Subset, Converted Data 

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ss_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] %>% 
               mutate(DateTime = paste(Date, Time))
ss_data[['DateTime']] <- strptime(ss_data[['DateTime']], format="%d/%m/%Y %H:%M:%S", tz = "UTC")

# Plot 2

png(file="plot2.png",
    width=480, height=480)

plot(ss_data$DateTime, ss_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()