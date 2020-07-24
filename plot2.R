my_dataset<-read.table("C:/Users/188048/Desktop/specdata/ExData_Plotting1/household_power_consumption.txt",
                       header=TRUE,sep=";")
my_data <- subset(my_dataset,as.Date(Date,"%d/%m/%Y") =="2007-02-01" |as.Date(Date,"%d/%m/%Y")=="2007-02-02" )


my_data$Time <- strptime(my_data$Time, format="%H:%M:%S")
my_data[1:1440,"Time"] <- format(my_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
my_data[1441:2880,"Time"] <- format(my_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png",width=480,height=480)
plot(my_data$Time,as.numeric(as.character(my_data$Global_active_power)),type="l"
     ,xlab="",ylab="Global Active Power (kilowatts)",main = "Global Active Power V/s Time")
dev.off(which=dev.cur())
