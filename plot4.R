powerConsumptionData <- read.table("household_power_consumption.txt", sep=";",
                                   header=TRUE, 
                                   na.strings = "?", 
                                   stringsAsFactors=FALSE)
#explore using colClasses

powerConsumptionData$DateTime <- paste(powerConsumptionData$Date, powerConsumptionData$Time)
powerConsumptionData$DateTime <- strptime(powerConsumptionData$DateTime, format="%d/%m/%Y %H:%M:%S")

startDate = strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
endDate = strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")

subSetData2Plot  = powerConsumptionData[powerConsumptionData$DateTime>=startDate & 
                                            powerConsumptionData$DateTime<endDate, ]

#png("plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))
par(mar = c(4,4,1,1))
par(cex=0.5)

plot(subSetData2Plot$DateTime,subSetData2Plot$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)" , xlab="" )

yrange<-range(c(subSetData2Plot$Sub_metering_1,
                subSetData2Plot$Sub_metering_2,
                subSetData2Plot$Sub_metering_3))

plot(subSetData2Plot$DateTime,subSetData2Plot$Sub_metering_1, type="l",
     ylab="Energy Sub Metering" , xlab="", ylim=yrange )
lines(subSetData2Plot$DateTime,subSetData2Plot$Sub_metering_2, col="Red")
lines(subSetData2Plot$DateTime,subSetData2Plot$Sub_metering_3, col="Blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col= c("Black", "Red", "Blue"), lty=1)

plot(subSetData2Plot$DateTime,subSetData2Plot$Voltage,
     type="l", ylab="Voltage" , xlab="datetime" )

plot(subSetData2Plot$DateTime,subSetData2Plot$Global_reactive_power,
     type="s", ylab="Global_reactive_power" , xlab="datetime" )

#dev.off()