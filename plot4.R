my_dataset<-read.table("C:/Users/188048/Desktop/specdata/ExData_Plotting1/household_power_consumption.txt",
                       header=TRUE,sep=";")
my_data <- subset(my_dataset,as.Date(Date,"%d/%m/%Y") =="2007-02-01" |as.Date(Date,"%d/%m/%Y")=="2007-02-02" )


my_data$Time <- strptime(my_data$Time, format="%H:%M:%S")
my_data[1:1440,"Time"] <- format(my_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
my_data[1441:2880,"Time"] <- format(my_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))
with(my_data,plot(Time,as.numeric(as.character(Global_active_power)),
                  type="l",xlab="",ylab="Global Active Power"))

with(my_data,plot(Time,as.numeric(as.character(Voltage)),
                  type="l",xlab="datetime",ylab="Voltage"))

with(my_data,plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(my_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(my_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(my_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.5)

with(my_data,plot(Time,as.numeric(as.character(Global_reactive_power)),
                  type="l",xlab="datetime",ylab="Global Reactive Power"))

dev.off(which=dev.cur())
