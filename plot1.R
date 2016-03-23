path <- "./household_power_consumption.txt"
AllData <- data.table(read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec="."))
data4plots<-subset(AllData,Date %in% c("1/2/2007","2/2/2007"))
png("plot1.png", width=480, height=480)
with(subSetData,hist(as.numeric(Global_active_power),col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency"))
dev.off()