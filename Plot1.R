#Course4 Week1 Assignment
setwd("F:\\EigeneDateien\\Coursera\\DataScience\\R-Course_WorkingDirectory\\Course4\\Week1\\Assignment\\ExData_Plotting1\\ExData_Plotting1")
myURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(myURL, temp)
unzip(temp, "household_power_consumption.txt")
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
unlink(temp)

#Plot1
subdata <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007") 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

png(filename = "Plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(subdata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (Kilowats)", col = "red")
dev.off()
