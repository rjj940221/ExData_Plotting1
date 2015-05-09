library("dplyr", lib.loc="~/R/win-library/3.1")

if(!file.exists("household_power_consumption.txt"))
{
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,destfile = "household_power_consumption.txt")
}
data<-read.table("household_power_consumption.txt",header = TRUE ,sep = ";"
                 ,na.strings = "?")
data<-mutate(data,Date=as.Date(Date,"%d/%m/%Y"))
data<-filter(data,Date>"2007-01-31"& Date<"2007-02-03")

date<-paste(data[,1],data[,2])
date<-strptime(x = date,"%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))
plot(date,data[,3],xlab = "", ylab ="Global ActivePower", type = "l")
plot(date,data[,5],xlab = "datetime",ylab = "Voltage",type = "l")
plot(date,data[,7],xlab = "",ylab = "Energy sub metering",type = "l")
points(date,data[,8],type="l",col="red")
points(date,data[,9],type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        ,col=c("black","red","blue"),lty=1)
plot(date,data[,4],xlab = "datetime",ylab = "Global_reactive_power",type = "l")