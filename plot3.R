#
# Exploratory Data Analysis: Project 1
# Reproducing Plot 3: Time evolution  of  'Energy sub metering'
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

# CREATING TIME AXIS  (commented in plot2.R)
datetime <- as.POSIXct(paste(as.Date(data$Date,format="%d/%m/%Y"),data$Time))
 
# GRAPH & CREATING PNG FILE
png(file="plot3.png", width=480, height=480, bg="white")
# alternatively, transparent backgroud:
# png(file="plot3.png", width=480, height=480, bg="transparent")

plot(datetime,data$Sub_metering_1,
     type="l",col="black",
     xlab="",ylab="Energy sub metering")
lines(datetime,data$Sub_metering_2,
      type="l",col="red")
lines(datetime,data$Sub_metering_3,
      type="l",col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)

dev.off() 