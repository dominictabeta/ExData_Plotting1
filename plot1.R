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
hpc_select$Time <- strptime(hpc_select$Time,format = "%H:%M:%S")

# open PNG graphic device
png(filename="plot1.png",width=480,height = 480,units="px")

# plot to 'plot1.png'
hist(hpc_select$Global_active_power,xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power",col="red")

# close graphic device, save to 'plot1.png'
dev.off()



