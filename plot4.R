hpc <- read.table("household_power_consumption.txt", header = TRUE,sep=";",stringsAsFactors = FALSE)

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

hpc_select <- subset(hpc,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

hpc_select$Global_active_power <- as.numeric(hpc_select$Global_active_power)
hpc_select$Global_reactive_power <- as.numeric(hpc_select$Global_reactive_power)
hpc_select$Voltage <- as.numeric(hpc_select$Voltage)
hpc_select$Global_intensity <- as.numeric(hpc_select$Global_intensity)
hpc_select$Sub_metering_1 <- as.numeric(hpc_select$Sub_metering_1)
hpc_select$Sub_metering_2 <- as.numeric(hpc_select$Sub_metering_2)
hpc_select$Sub_metering_3 <- as.numeric(hpc_select$Sub_metering_3)
hpc_select$datetime <- as.POSIXct(paste(hpc_select$Date, hpc_select$Time),format="%Y-%m-%d %H:%M:%S")

# open PNG graphic device
png(filename="plot4.png",width=480,height = 480,units="px")

#set up plot layout of 2x2
par(mfrow=c(2,2))

# plot top-left
plot(x = hpc_select$datetime, y = hpc_select$Global_active_power, type = "l", ann = FALSE)
title(ylab = "Global Active Power (kilowatts)")

# plot top-right
plot(x = hpc_select$datetime, y = hpc_select$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")

# plot bottom-left
plot(x = hpc_select$datetime,y= hpc_select$Sub_metering_1,type="l",col="black", ann=FALSE)
lines(x = hpc_select$datetime,y= hpc_select$Sub_metering_2,type="l",col="red")
lines(x = hpc_select$datetime,y= hpc_select$Sub_metering_3,type="l",col="blue")
title(ylab = "Energy sub metering")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(1,1,1),bty = "n")


# plot bottom-right
plot(x = hpc_select$datetime, y = hpc_select$Global_reactive_power, type = "l",xlab = "datetime", ylab = "Global_reactive_power")


# close graphic device, save to 'plot4.png'
dev.off()



