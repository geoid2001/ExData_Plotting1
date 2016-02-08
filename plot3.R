##### required libraries
library(data.table)
library(lubridate)
setPath <- "/Users/geoid2001/downloads/"
setwd(setPath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

###Unzip DataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
DataPath <- "/Users/geoid2001/downloads/data/"

##### load data
dataHousePowerComsumption<- fread(file.path(DataPath,"household_power_consumption.txt"), sep = ";")
dataRequired <- dataHousePowerComsumption[Date %in% c("1/2/2007","2/2/2007")]
DateTime <- paste(dataRequired[,Date],dataRequired[,Time])
pasteDateTime <- dmy_hms(DateTime) 
GlobalActivePower <- as.numeric(dataRequired[,Global_active_power])
SubMetering1 <- as.numeric(dataRequired[,Sub_metering_1])
SubMetering2 <- as.numeric(dataRequired[,Sub_metering_2])
SubMetering3 <- as.numeric(dataRequired[,Sub_metering_3])
ColumnNames <-names(dataRequired)

png("plot3.png", width=480, height=480)
plot(pasteDateTime, SubMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(pasteDateTime, SubMetering2,type = "l",col="red")
lines(pasteDateTime, SubMetering3,type = "l",col="blue")
legend("topright", ColumnNames[7:9], lty=1, lwd=2., col=c("black", "red", "blue"))
dev.off()
