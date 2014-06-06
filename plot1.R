#
# Exploratory Data Analysis: Project 1
# Reproducing Plot 1: Histogram of  'Global active power'
#

# READING DATA
# we read the data from 'household_power_consumption.txt'
# which is contained in 'exdata-data-household_power_consumption.zip' located in working directory
# nrows=70000 suffices to get all the necessary data
data <- read.table(
    unz("exdata-data-household_power_consumption.zip",
        "household_power_consumption.txt"),
    sep=";",na.strings="?", header=TRUE, nrows=70000)
# data for the assignment
data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

# HISTOGRAM & CREATING PNG FILE
png(file="plot1.png", width=480, height=480, bg="white")
# alternatively, transparent backgroud:
# png(file="plot1.png", width=480, height=480, bg="transparent")

hist(data$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     main="Global Active Power")

dev.off() 