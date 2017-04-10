# import the entire file
everything <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

# subset the two days we're interested in
power <- subset(everything, (Date == "1/2/2007" | Date == "2/2/2007"))

# remove the large data set
rm(everything)

# open png screen device
png(file = "plot1.png")

# create histogram
hist(power$Global_active_power, 
     col="red",                                 # color is red
     xlab = "Global active power (kilowatts)",  # set x label
     main = "Global Active Power")              # set title

# close screen device
dev.off()