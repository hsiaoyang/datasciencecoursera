#plot1.R
#read data, and Extract the subset data 2007-02-01 and 2007-02-02
all_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",fill=TRUE,na.strings = "NA")
sub_data<-subset(all_data,all_data$Date=='1/2/2007'|all_data$Date=='2/2/2007')
sub_data$Global_active_power<-as.numeric(levels(sub_data$Global_active_power))[sub_data$Global_active_power]

# Create Drawing
png("plot1.png", width = 504, height = 504, units = "px", bg = "white")

#xaxt="n" empty the x axis
hist(sub_data$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red",xaxt="n")

#label x axis
axis(side=1,at=seq(0,3000,1000),label=c("0","2","4","6"))
dev.off()