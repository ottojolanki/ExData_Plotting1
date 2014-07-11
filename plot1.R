## import the sqldf package for loading the relevant part of the data
library(sqldf) 
myfile<-"household_power_consumption.txt"
mysql<-"SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
powerdata<-read.csv2.sql(myfile,sql=mysql,comment.char="",
            colClasses=c('character','character','numeric','numeric',
                         'numeric','numeric','numeric','numeric',
                         'numeric'),na.strings="?",stringsAsFactors=FALSE)
png(filename="plot1.png")
hist(powerdata$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()
