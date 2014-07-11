library(sqldf) 
myfile<-"household_power_consumption.txt"
mysql<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
powerdata<-read.csv2.sql(myfile,sql=mysql,comment.char="",
                         colClasses=c('character','character','numeric','numeric',
                                      'numeric','numeric','numeric','numeric',
                                      'numeric'),na.strings="?",stringsAsFactors=FALSE)
powerdata[,1] <- paste(powerdata$Date,powerdata$Time)
powerdata<-subset(powerdata,select=-c(Time))
powerdata$Date<-strptime(powerdata$Date,format="%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(powerdata$Date,powerdata$Global_active_power,type="n",xlab="",
     ylab="Global Active Power(kilowatts)")
lines(powerdata$Date,powerdata$Global_active_power)
dev.off()
