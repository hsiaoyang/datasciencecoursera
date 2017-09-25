#plot3.R
#read data, and Extract the subset data 2007-02-01 and 2007-02-02

all_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",fill=TRUE,na.strings = "NA")
sub_data<-subset(all_data,all_data$Date=='1/2/2007'|all_data$Date=='2/2/2007')

# Create Drawing
png("plot3.png", width = 504, height = 504, units = "px", bg = "white")
data_temp<-strptime(paste(sub_data$Date,sub_data$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
plot(data_temp,sub_data$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering",yaxp=c("0","30","3"))
points(data_temp,sub_data$Sub_metering_1,type="l")
points(data_temp,sub_data$Sub_metering_2,type="l",col="red")
points(data_temp,sub_data$Sub_metering_3,type="l",col="blue")
legend("topright",lwd="2",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()