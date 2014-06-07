powerConsumptionData <- read.table("household_power_consumption.txt", sep=";",
                                   header=TRUE, 
                                   na.strings = "?", 
                                   stringsAsFactors=FALSE)
powerConsumptionData$DateTime <- paste(powerConsumptionData$Date, powerConsumptionData$Time)
powerConsumptionData$DateTime <- strptime(powerConsumptionData$DateTime, format="%d/%m/%Y %H:%M:%S")


startDate = strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
endDate = strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")

subSetData2Plot  = powerConsumptionData[powerConsumptionData$DateTime>=startDate & 
                                        powerConsumptionData$DateTime<end?ploDate, ]

png("plot2.png", width = 480, height = 480)
plot(subSetData2Plot$DateTime,subSetData2Plot$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)" , xlab="" )
dev.off()