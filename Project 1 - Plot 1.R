
# Download and Subset Data 

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
ss_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Graphing and Saving Plot 1

png(file="plot1.png",
    width=480, height=480)

hist(ss_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.off()
