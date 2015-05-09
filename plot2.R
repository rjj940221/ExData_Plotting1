library("dplyr", lib.loc="~/R/win-library/3.1")

if(!file.exists("household_power_consumption.txt"))
{
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,destfile = "household_power_consumption.txt")
}
data<-read.table("household_power_consumption.txt",header = TRUE ,sep = ";",na.strings = "?")
data<-mutate(data,Date=as.Date(Date,"%d/%m/%Y"))
data<-filter(data,Date>"2007-01-31"& Date<"2007-02-03")

date<-paste(data[,1],data[,2])
date<-strptime(x = date,"%Y-%m-%d %H:%M:%S")

plot(date,data[,3],xlab = "", ylab ="Global ActivePower (kilowatts)", type = "l")