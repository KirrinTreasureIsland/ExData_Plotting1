#
# Exploratory Data Analysis: Project 1
# Reproducing Plot 4: Four subplots
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
png(file="plot4.png", width=480, height=480, bg="white")
# alternatively, transparent backgroud:
# png(file="plot4.png", width=480, height=480, bg="transparent")

# subplot: 2 rows, 2 columns
par(mfrow = c(2, 2))

# subplot: top, left
plot(datetime,data$Global_active_power,
     type="l",
     xlab="",ylab="Global Active Power")

# subplot: top, right
plot(datetime,data$Voltage,
     type="l",
     xlab="datetime",ylab="Voltage")

# subplot: bottom, left
plot(datetime,data$Sub_metering_1,
     type="l",
     xlab="",ylab="Energy sub metering",
     col="black")
lines(datetime,data$Sub_metering_2,type="l",col="red")
lines(datetime,data$Sub_metering_3,type="l",col="blue")

legend("topright",
       bty="n", lty=1, 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))
       
# subplot: bottom, right
plot(datetime,data$Global_reactive_power,
     type="l",
     xlab="datetime",ylab="Global_reactive_power")


dev.off() 