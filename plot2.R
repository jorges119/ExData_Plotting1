plot2 <- function() {
  data <- read.csv("~/exploratory/household_power_consumption.txt", sep=";")
  ##Only data from 2007-02-01 and 2007-02-02
  workData<-data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
  wDays <- strptime(paste(workData$Date, workData$Time), format='%d/%m/%Y %H:%M:%S')
  par(mfcol = c(1,1))
  plot(wDays,as.numeric(as.character(workData$Global_active_power)),type="l", xlab = " ", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file ="plot2.png",width = 480, height = 480) 
  dev.off()
}
