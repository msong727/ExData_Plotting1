# Read data

initial <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",nrow=100)
classes <- sapply(initial, class)
dat <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",colClasses=classes)
dat$Date = as.Date(dat$Date,format = "%d/%m/%Y")
dat=subset(dat, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

#### plot 4
attach(dat)
png(filename="plot4.png", width=480, height=480) 
par(mfrow=c(2,2))
# 4.1
plot(Global_active_power, type="l",xaxt="n", xlab="", 
    ylab="Global Active Power (kilowatts)")
middle <- length(Date)/2
axis(1, at=c(1, middle, length(Date)), labels=c("Thu", "Fri", "Sat"))

# 4.2
plot(Voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
mid <- length(Date)/2
axis(1, at=c(1, middle, length(Date)), labels=c("Thu", "Fri", "Sat"))

# 4.3
plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2, col="red")
lines(Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
middle <- length(Date)/2
axis(1, at=c(1, middle, length(Date)), labels=c("Thu", "Fri", "Sat"))

# 4.4
plot(Global_reactive_power, type="l",xaxt="n",xlab="datetime")
middle <- length(Date)/2
axis(1, at=c(1, middle, length(Date)), labels=c("Thu", "Fri", "Sat"))

par(mfrow=c(1,1))
dev.off()



