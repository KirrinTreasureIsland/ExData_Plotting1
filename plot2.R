#
# Exploratory Data Analysis: Project 1
# Reproducing Plot 2: Time evolution  of  'Global active power'
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

# CREATING TIME AXIS
datetime <- as.POSIXct(paste(as.Date(data$Date,format="%d/%m/%Y"),data$Time))

# REMARKS to the above: 
#
# head(data)
#         Date     Time Global_active_power Global_reactive_power Voltage
# 1 16/12/2006 17:24:00               4.216                 0.418  234.84
# 2 16/12/2006 17:25:00               5.360                 0.436  233.63
# 3 16/12/2006 17:26:00               5.374                 0.498  233.29
# 4 16/12/2006 17:27:00               5.388                 0.502  233.74
# 5 16/12/2006 17:28:00               3.666                 0.528  235.68
# 6 16/12/2006 17:29:00  
#
# etc.
#
# datetime_auxiliary=paste(as.Date(data$Date,format="%d/%m/%Y"),data$Time)
# head(datetime_auxiliary)
# [1] "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00"
# [4] "2007-02-01 00:03:00" "2007-02-01 00:04:00" "2007-02-01 00:05:00"
# class(datetime_auxiliary)
# [1] "character" 
#
# datetime=as.POSIXct(paste(as.Date(data$Date,format="%d/%m/%Y"),data$Time))
# head(datetime)
# [1] "2007-02-01 00:00:00 CET" "2007-02-01 00:01:00 CET" "2007-02-01 00:02:00 CET"
# [4] "2007-02-01 00:03:00 CET" "2007-02-01 00:04:00 CET" "2007-02-01 00:05:00 CET"
# class(datetime)
# [1] "POSIXct" "POSIXt" 


# GRAPH & CREATING PNG FILE
png(file="plot2.png", width=480, height=480, bg="white")
# alternatively, transparent backgroud:
# png(file="plot2.png", width=480, height=480, bg="transparent")

plot(datetime,data$Global_active_power,
     type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off() 