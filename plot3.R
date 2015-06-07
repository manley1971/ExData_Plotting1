source("ExploratoryDataProjectOne//GetPowerData.R")
png("ExploratoryDataProjectOne//plot3.png")
plot(power$Combined,power$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(power$Combined,power$Sub_metering_2, col= "red")
lines(power$Combined,power$Sub_metering_3, col= "blue")
legend(x="topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty="solid",
       col = c("black","red","blue"))
dev.off()