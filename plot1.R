my_dataset<-read.table("C:/Users/188048/Desktop/specdata/ExData_Plotting1/household_power_consumption.txt",
                       header=TRUE,sep=";")
my_data <- subset(my_dataset,as.Date(Date,"%d/%m/%Y") =="2007-02-01" |as.Date(Date,"%d/%m/%Y")=="2007-02-02" )
png("plot1.png",width=480,height=480)
plot1<-hist(as.numeric(as.character(my_data$Global_active_power)),
     xlab= "Global Active Power (kilowatts)"
     ,main="Global Active Power",col="red")

dev.off(which=dev.cur())

