source("ExploratoryDataProjectOne//GetPowerData.R")
png("ExploratoryDataProjectOne//plot2.png")
#note that the ylab is similar to what is the variable name but not exact
plot(power$Combined,power$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()