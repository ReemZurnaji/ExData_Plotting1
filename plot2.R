getwd()
setwd("./Desktop/Exploratory Data Analysis")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./Electric power consumption.zip", method = "curl")
unzip("Electric power consumption.zip")
library(sqldf)
library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows=2880,sep = ";",na.strings = "?") #subtracted 1 from skip so that i don't lose the first line that starts with 1/2/2007
names(data) <- names(read.table("household_power_consumption.txt", header = TRUE, nrows = 1,sep = ';'))
data$DateTime <- strptime(paste(data$Date, data$Time,sep= " "),format = "%d/%m/%Y %H:%M:%S") #combined Date and Time variable in DateTime 
with(data,plot(DateTime,Global_active_power,col = "black",xlab= "",ylab = "Global Active Power (Kilowatts)",type= "l"))
setwd("./ExData_Plotting1")
dev.copy(png, file= "plot2.png", width= 480, height= 480) #copied the plot to a png device
dev.off()
