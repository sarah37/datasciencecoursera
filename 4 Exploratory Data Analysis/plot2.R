# import the entire file
everything <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

# subset the two days we're interested in
power <- subset(everything, (Date == "1/2/2007" | Date == "2/2/2007"))

# remove the large data set
rm(everything)

# combine date and time columns
power$datetime <- paste(power$Date, power$Time)

# format dates as dates
power$datetime <- strptime(power$datetime, format = "%d/%m/%Y %H:%M:%S")

# remove old date time columns
power <- power[-c(1, 2)]

##############

# open png screen device
# 480px x 480px is the default setting, so there is no need to set it explicitly
png(file = "plot2.png")

# plot power vs date/time
plot(power$datetime, power$Global_active_power, 
     type = "l",                               # line plot
     xlab = "",                                # no x label
     ylab = "Global Active Power (kilowatts)") # set y label

# close screen device
dev.off()