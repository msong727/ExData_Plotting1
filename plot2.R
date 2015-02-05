# Read data
initial <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",nrow=100)
classes <- sapply(initial, class)
dat <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",colClasses=classes)

dat$Date = as.Date(dat$Date,format = "%d/%m/%Y")
dat=subset(dat, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

### plot 2
attach(dat)
png(filename="plot2.png", width=480, height=480)
plot(Global_active_power,type='l',xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)")
middle <- length(Date)/2
axis(1, at=c(1, middle, length(Date)), labels=c("Thu", "Fri", "Sat"))
dev.off()

