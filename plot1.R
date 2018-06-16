library(lubridate)
##load data
ds0<-read.csv("household_power_consumption.txt", sep=";", na.string="?", stringsAsFactors = FALSE)

##get only 2 days' data
ds<-filter(ds0, Date=="1/2/2007"|Date=="2/2/2007")

## remove original whole data set to release some memory
rm(ds0)

#add TimeStamp variable which is the combination of Date and Time variables
ds<-mutate(ds, TimeStamp=lubridate::dmy_hms(paste(Date, Time)))

png("plot1.png", width = 480, height = 480)
hist(ds$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
