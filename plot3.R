# Read data

initial <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",nrow=100)
classes <- sapply(initial, class)
dat <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",colClasses=classes)

dat$Date = as.Date(dat$Date,format = "%d/%m/%Y")
dat=subset(dat, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

#### plot3
attach(dat)
png(filename="plot3.png", width=480, height=480)
plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2, col="red")
lines(Sub_metering_3, col="blue")

middle <- length(Date)/2
axis(1, at=c(1, middle, length(Date)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1,lwd=2,cex=0.9, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

