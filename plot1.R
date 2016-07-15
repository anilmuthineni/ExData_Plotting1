# Load power consumption data
power_consumption_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Convert date strings into Dates
power_consumption_data$Date <- as.Date(power_consumption_data$Date, "%d/%m/%Y")

# Choose the data we are interested in
exploration_data <- power_consumption_data[power_consumption_data$Date <= "2007-02-02" & power_consumption_data$Date >= "2007-02-01",]

# Set png parameters
png(filename="plot1.png", width = 480, height = 480, bg = "white")

# Plot histogram
hist(as.numeric(as.character(exploration_data$Global_active_power)), col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

dev.off()
