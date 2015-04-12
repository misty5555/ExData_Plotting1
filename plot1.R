newdataset<-read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")
dataset1<-subset(newdataset,Date=="1/2/2007")
dataset2<-subset(newdataset,Date=="2/2/2007")
dataset3<-rbind(dataset1,dataset2)
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
with(dataset3,hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200)))
dev.off()