path <- "./household_power_consumption.txt"
AllData <- data.table(read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="."))
data4plots<-subset(AllData,Date %in% c("1/2/2007","2/2/2007"))
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))
with(data4plots,plot(dmy_hms(paste(Date,Time, sep=" ")),as.numeric(Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab=""))

plot(dmy_hms(paste(data4plots$Date,data4plots$Time, sep=" ")),as.numeric(data4plots$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(dmy_hms(paste(data4plots$Date,data4plots$Time, sep=" ")),as.numeric(data4plots$Sub_metering_2),type="l",col="red")
lines(dmy_hms(paste(data4plots$Date,data4plots$Time, sep=" ")),as.numeric(data4plots$Sub_metering_3),type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data4plots,plot(dmy_hms(paste(Date,Time, sep=" ")),as.numeric(Voltage),type="l",ylab="",xlab="datetime"))

with(data4plots,plot(dmy_hms(paste(Date,Time, sep=" ")),as.numeric(Global_reactive_power),type="l",ylab="",xlab="datetime"))
dev.off()