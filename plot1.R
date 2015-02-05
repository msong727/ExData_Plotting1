
# Read data 
initial <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",nrow=100)
classes <- sapply(initial, class)
dat <- read.table("household_power_consumption.txt",sep=';',header=T,
    stringsAsFactors=F, na.strings = "?",colClasses=classes)
dim(dat)  # 2075259  9
object.size(dat)

dat$Date = as.Date(dat$Date,format = "%d/%m/%Y")
dat=subset(dat, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

dim(dat)  # 2880 9

## plot 1
attach(dat)
png(filename="plot1.png", width=480, height=480) 
hist(Global_active_power,col="red", main="Global Active Power",
    xlab="Global Active Power (kilowatts)")
dev.off()

