#plot4.R
#read data, and Extract the subset data 2007-02-01 and 2007-02-02

all_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",fill=TRUE,na.strings = "NA")
sub_data<-subset(all_data,all_data$Date=='1/2/2007'|all_data$Date=='2/2/2007')
# Create Drawing

png("plot4.png", width = 504, height = 504, units = "px", bg = "white")
par(mfrow=c(2,2))

#Draw the first picture
data_temp<-strptime(paste(sub_data$Date,sub_data$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
plot(data_temp,sub_data$Global_active_power,type="l",
     xlab = " " ,
     ylab="Global Activite Power (killwatts)",yaxt="n")
axis(2,at=seq(0,3000,1000),label=c("0","2","4","6"))

#Draw the second diagram
sub_data$Voltage<-as.numeric(levels(sub_data$Voltage))[sub_data$Voltage]
plot(data_temp,sub_data$Voltage,type="l",xlab="datetime",
     ylab="Voltage")
#axis(side=2,at=seq(234,264,2),label=seq(234,264,2))

#Draw a third diagram
plot(data_temp,sub_data$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering",yaxp=c("0","30","3"))
points(data_temp,sub_data$Sub_metering_1,type="l")
points(data_temp,sub_data$Sub_metering_2,type="l",col="red")
points(data_temp,sub_data$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=0.3,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),border ="0")


#Draw the fourth diagram
sub_data$Global_reactive_power<-as.numeric(levels(sub_data$Global_reactive_power))[sub_data$Global_reactive_power]
plot(data_temp,sub_data$Global_reactive_power,type="l",xlab="datatime",ylab="Global_reactive_power")
dev.off()