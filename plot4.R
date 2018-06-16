library(lubridate)
##load data
ds0<-read.csv("household_power_consumption.txt", sep=";", na.string="?", stringsAsFactors = FALSE)

##get only 2 days' data
ds<-filter(ds0, Date=="1/2/2007"|Date=="2/2/2007")

## remove original whole data set to release some memory
rm(ds0)

#add TimeStamp variable which is the combination of Date and Time variables
ds<-mutate(ds, TimeStamp=lubridate::dmy_hms(paste(Date, Time)))

png("plot4.png", width = 480, height = 480)
#create 2 by 2 area for 4 plot panels
par(mfrow=c(2,2))
#plot1
plot(ds$Global_active_power~ds$TimeStamp,xlab="",ylab="Global Active Power", type="l")
#plot2
plot(ds$Voltage~ds$TimeStamp,xlab="datetime", ylab="Voltage", type="l")
#plot3
plot(ds$TimeStamp, ds$Sub_metering_1, col="black",xlab="", ylab = "Energy sub metering", type="l")
lines(ds$Sub_metering_2~ds$TimeStamp, col="red")
lines(ds$Sub_metering_3~ds$TimeStamp, col="blue")
legend("topright", bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
#plot4
plot(ds$Global_reactive_power~ds$TimeStamp,xlab="datetime",ylab="Global_reactive_Power", type="l")
dev.off()
