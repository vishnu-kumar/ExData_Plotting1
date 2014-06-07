powerConsumptionData <- read.table("household_power_consumption.txt", sep=";",
                                   header=TRUE, 
                                   na.strings = "?", 
                                   stringsAsFactors=FALSE)

powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format="%d/%m/%Y")

startDate = as.Date("2007-02-01", format="%Y-%m-%d")
endDate = as.Date("2007-02-02", format="%Y-%m-%d")

subSetData2Plot  = powerConsumptionData[powerConsumptionData$Date>=startDate & 
                                        powerConsumptionData$Date<=endDate, ]

png("plot1.png", width = 480, height = 480)

hist(subSetData2Plot$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col=c("RED"))

dev.off()


