source("ExploratoryDataProjectOne//GetPowerData.R")
png("ExploratoryDataProjectOne//plot4.png")
par(mfrow=c(2,2))

#top left:
plot(power$Combined,power$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")

#top right:
plot(power$Combined,power$Voltage,type="l",xlab="datetime",ylab="Voltage")

#bottom left:
plot(power$Combined,power$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(power$Combined,power$Sub_metering_2, col= "red")
lines(power$Combined,power$Sub_metering_3, col= "blue")
legend(x="topright",
    #    box.col=0,
    bty="n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty="solid",
       col = c("black","red","blue"))


#bottom right:
plot(power$Combined,power$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()