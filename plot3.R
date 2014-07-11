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
png("plot3.png")
plot(powerdata$Date,powerdata$Sub_metering_1,type="n",xlab="",
     ylab="Energy Sub Metering")
lines(powerdata$Date,powerdata$Sub_metering_1,col="black")
lines(powerdata$Date,powerdata$Sub_metering_2,col="red")
lines(powerdata$Date,powerdata$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
