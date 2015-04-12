DF <-read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")
DF <-DF[ DF$Date == "1/2/2007"  |  DF$Date == "2/2/2007" , ]
DF$DateTime <- as.POSIXct(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")
head(DF)
rownames(DF) <- 1:nrow(DF)
png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(DF$DateTime, DF$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()