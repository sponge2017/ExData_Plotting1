library(lubridate)
##load data
ds0<-read.csv("household_power_consumption.txt", sep=";", na.string="?", stringsAsFactors = FALSE)

##get only 2 days' data
ds<-filter(ds0, Date=="1/2/2007"|Date=="2/2/2007")

## remove original whole data set to release some memory
rm(ds0)

#add TimeStamp variable which is the combination of Date and Time variable
ds<-mutate(ds, TimeStamp=lubridate::dmy_hms(paste(Date, Time)))

png("plot3.png", width = 480, height = 480)
with(ds, plot(TimeStamp, Sub_metering_1, col="black",xlab="", ylab = "Energy sub metering", type="l"))
lines(ds$Sub_metering_2~ds$TimeStamp, col="red")
lines(ds$Sub_metering_3~ds$TimeStamp, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
dev.off()
