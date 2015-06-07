source("ExploratoryDataProjectOne//GetPowerData.R")
png("ExploratoryDataProjectOne//plot1.png")
hist(power$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
dev.off()