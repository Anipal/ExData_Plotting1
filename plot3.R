setwd("/home/anisha/Downloads/exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", sep = ';', na.strings = "?", stringsAsFactors=F, header = T)
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data_time_date <-paste(data_sub$Time, data_sub$Date, sep=" ")
data_time_date <- strptime(data_time_date, "%H:%M:%S %d/%m/%Y")

png("plot3.png", width=480, height=480)
plot(data_time_date,data_sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data_time_date, data_sub$Sub_metering_2, col="red")
lines(data_time_date,data_sub$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
