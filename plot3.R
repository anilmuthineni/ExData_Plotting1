# Load power consumption data
power_consumption_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Create a column which contains both date and time
power_consumption_data$Datetime <- strptime(paste(power_consumption_data$Date, power_consumption_data$Time, " "), format = "%d/%m/%Y %H:%M:%S")

# Convert date strings into Dates
power_consumption_data$Date <- as.Date(power_consumption_data$Date, "%d/%m/%Y")

# Choose the data we are interested in
exploration_data <- power_consumption_data[power_consumption_data$Date <= "2007-02-02" & power_consumption_data$Date >= "2007-02-01",]

# Set png parameters
png(filename="plot3.png", width = 480, height = 480, bg = "white")

# Plot
plot(exploration_data$Datetime,exploration_data$Sub_metering_1, type='l', xlab='', ylab='Energy sub-metering')
lines(exploration_data$Datetime,exploration_data$Sub_metering_2, type='l', col='red')
lines(exploration_data$Datetime,exploration_data$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1)
dev.off()

