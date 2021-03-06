data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- data[ ,!(names(data) %in% c("Date","Time"))]
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col= "red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
