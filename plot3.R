plot3 <- function() {
  data <- read.csv("~/exploratory/household_power_consumption.txt", sep=";")
  ##Only data from 2007-02-01 and 2007-02-02
  workData<-data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
  wDays <- strptime(paste(workData$Date, workData$Time), format='%d/%m/%Y %H:%M:%S')

  par(mfcol = c(1,1))
  plot(wDays,as.numeric(as.character(workData$Sub_metering_1)), type="n", xlab = " ", ylab="Energy sub metering", col="black")
  points(wDays,as.numeric(as.character(workData$Sub_metering_1)),col="black",type="l")
  points(wDays,as.numeric(as.character(workData$Sub_metering_2)),col="red",type="l")
  points(wDays,as.numeric(as.character(workData$Sub_metering_3)),col="blue",type="l")
  legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1     ", "Sub_metering_2     ", "Sub_metering_3     "),cex=0.8)
  dev.copy(png, file ="plot3.png",width = 480, height = 480) 
  dev.off()
}
