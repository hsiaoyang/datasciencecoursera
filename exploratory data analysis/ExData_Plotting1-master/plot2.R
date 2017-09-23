#plot2.R
#read data, and Extract the subset data 2007-02-01 and 2007-02-02
all_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",fill=TRUE,na.strings = "NA")
sub_data<-subset(all_data,all_data$Date=='1/2/2007'|all_data$Date=='2/2/2007')
sub_data$Global_active_power<-as.numeric(levels(sub_data$Global_active_power))[sub_data$Global_active_power]

# Create Drawing
png("plot2.png", width = 504, height = 504, units = "px", bg = "white")
data_temp<-strptime(paste(sub_data$Date,sub_data$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
plot(data_temp,sub_data$Global_active_power,type="l",xlab = " " ,ylab="Global Activite Power (killwatts)")
dev.off()