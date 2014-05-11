plot4 <- function() {
  data <- read.csv("~/exploratory/household_power_consumption.txt", sep=";")
  ##Only data from 2007-02-01 and 2007-02-02
  workData<-data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
  wDays <- strptime(paste(workData$Date, workData$Time), format='%d/%m/%Y %H:%M:%S')
  
  par(mfcol = c(2,2))
  
  #First plot
  plot(wDays,as.numeric(as.character(workData$Global_active_power)),type="l", xlab = " ", ylab="Global Active Power")
  
  #Second plot
  plot(wDays,as.numeric(as.character(workData$Sub_metering_1)), type="n", xlab = " ", ylab="Energy sub metering", col="black")
  points(wDays,as.numeric(as.character(workData$Sub_metering_1)),col="black",type="l")
  points(wDays,as.numeric(as.character(workData$Sub_metering_2)),col="red",type="l")
  points(wDays,as.numeric(as.character(workData$Sub_metering_3)),col="blue",type="l")
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1       ", "Sub_metering_2      ", "Sub_metering_3      "),cex=0.5, bty = "n")
  
  #Third Plot
  plot(wDays, as.numeric(as.character(workData$Voltage)), type="l", xlab="datetime", ylab="Voltage")
  
  #Fourth Plot Global_reactive_power
  plot(wDays, as.numeric(as.character(workData$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file ="plot4.png",width = 480, height = 480) 
  dev.off()
}
