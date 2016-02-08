#### required library
library(data.table)

setPath <- "/Users/geoid2001/downloads/"
setwd(setPath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

###Unzip DataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
DataPath <- "/Users/geoid2001/downloads/data/"

#### load data
dataHousePowerComsumption<- fread(file.path(DataPath,"household_power_consumption.txt"), sep = ";")
dataRequired <- dataHousePowerComsumption[Date %in% c("1/2/2007","2/2/2007")]
GlobalActivePower <- as.numeric(dataRequired[,Global_active_power])
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
