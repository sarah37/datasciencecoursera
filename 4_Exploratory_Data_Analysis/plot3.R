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

################

# open png screen device
# 480px x 480px is the default setting, so there is no need to set it explicitly
png(file = "plot3.png")

# plot sub meterings vs date/time by plotting the first one, then adding lines for the other ones
plot(power$datetime, power$Sub_metering_1, 
     type = "l",                   # line plot
     xlab = "",                    # empty x label
     ylab = "Energy sub metering") # set y label

lines(power$datetime, power$Sub_metering_2, col="red")
lines(power$datetime, power$Sub_metering_3, col="blue")

# add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), # text for legend
       col = c("black", "red", "blue"),                                  # colours
       lty = 1)                                                          # set line type


# close screen device
dev.off()