data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- data[ ,!(names(data) %in% c("Date","Time"))]
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

#Plot 2
plot(data$Global_active_power ~ data$dateTime, type = "l", ylab= "Global Active Power", xlab="")

