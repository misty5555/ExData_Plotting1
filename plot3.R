DF <-read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")
DF <-DF[ DF$Date == "1/2/2007"  |  DF$Date == "2/2/2007" , ]
DF$DateTime <- as.POSIXct(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")
head(DF)
rownames(DF) <- 1:nrow(DF)
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
x<-DF$DateTime
y1<-DF$Sub_metering_1
y2<-DF$Sub_metering_2
y3<-DF$Sub_metering_3
plot(x,y1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col="black")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()