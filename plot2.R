path <- "./household_power_consumption.txt"
AllData <- data.table(read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="."))
data4plots<-subset(AllData,Date %in% c("1/2/2007","2/2/2007"))
png("plot2.png", width=480, height=480)
with(data4plots,plot(dmy_hms(paste(Date,Time, sep=" ")),as.numeric(Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()