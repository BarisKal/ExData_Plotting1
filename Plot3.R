#Course4 Week1 Assignment
setwd("F:\\EigeneDateien\\Coursera\\DataScience\\R-Course_WorkingDirectory\\Course4\\Week1\\Assignment\\ExData_Plotting1\\ExData_Plotting1")
myURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(myURL, temp)
unzip(temp, "household_power_consumption.txt")
mydata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
unlink(temp)

#Plot3
subdata <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007") 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

png(filename = "Plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(subdata$DateTime, subdata$Sub_metering_1, type="line",xlab = "", ylab = "Energy sub meetering")
points(subdata$DateTime,subdata$Sub_metering_2, type="line", col="red")
points(subdata$DateTime,subdata$Sub_metering_3, type="line", col="blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
