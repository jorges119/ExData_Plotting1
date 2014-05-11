plot1 <- function() {
  data <- read.csv("~/exploratory/household_power_consumption.txt", sep=";")
  ##Only data from 2007-02-01 and 2007-02-02
  workData<-data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
  #workData<-subset(data, as.Date(Date)>"2007-02-01"&as.Date(Date)<"2011-02-02")%d-
  par(mfcol = c(1,1))
  hist(as.numeric(as.character(workData$Global_active_power)), col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(png, file ="plot1.png",width = 480, height = 480) 
  dev.off()
}