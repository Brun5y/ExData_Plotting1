housepower <- read.table("household_power_consumption.txt",sep=";")
names(housepower)[1] <- as.character(housepower[1,1])
names(housepower)[2] <- as.character(housepower[1,2])
names(housepower)[3] <- as.character(housepower[1,3])
names(housepower)[4] <- as.character(housepower[1,4])
names(housepower)[5] <- as.character(housepower[1,5])
names(housepower)[6] <- as.character(housepower[1,6])
names(housepower)[7] <- as.character(housepower[1,7])
names(housepower)[8] <- as.character(housepower[1,8])
names(housepower)[9] <- as.character(housepower[1,9])
housepower = housepower[-1,]
good <- (housepower[,1] == "1/2/2007" | housepower[,1] == "2/2/2007")
housepowersubset <-housepower[good,] 
date <- housepowersubset[,1]
time <- housepowersubset[,2]
Date_Time <- paste(date,time)
Date_Time <- strptime(Date_Time, format="%d/%m/%Y %H:%M:%S")
housepowersubset <- cbind(housepowersubset,Date_Time)
png(filename = "Plot4.png", width = 480, height = 480, units = 'px')
par(mfcol = c(2,2))
GAP <- as.numeric(as.character(housepowersubset[,3]))
plot(Date_Time,GAP, type = "o", pch = "." , xlab = "", ylab = "Global Active Power (kilowatts)")
plot(housepowersubset[,10],as.numeric(as.character(housepowersubset[,7])) , type = "l", xlab = "", ylab = "Energy sub metering")
lines(housepowersubset[,10],as.numeric(as.character(housepowersubset[,8])), col = "red")
lines(housepowersubset[,10],as.numeric(as.character(housepowersubset[,9])), col = "blue")
legend("topright", lty = 1, col = c('black', "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
Voltage <- as.numeric(as.character(housepowersubset[,5]))
plot(Date_Time,Voltage , type = "o", pch = "." , xlab = "datetime", ylab = "Voltage" )
plot(Date_Time,as.numeric(as.character(housepowersubset[,4])), type = "o", pch = "." , xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
