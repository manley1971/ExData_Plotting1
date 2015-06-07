#GetPowerData gets sourced by all of the plot files to get the 
#data--it'd be the same code used in each file.

#It stores the two days worth of data that it uses to a file if
#that file doesn't exist and reads that file if it does.

#For a change to the functions, be sure to delete it.

# I use the lubridate library, there are other date options though it
# is the easiest
library(lubridate)
datadir = "Explore_Power_Data"
powerdatafile<-paste(datadir,"household_power_consumption.txt",sep="\\")
YEAR = 2007
MONTH = 2
START_DATE = 1
END_DATE = 2


get_data_files<-function(datadir)
{
        powerUrl = 
                "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
        zipfile = "PowerData.zip"
        
        zipfileFullPath = paste(datadir, "//",zipfile, sep="")
        
        #No need to re-download if it already exists!
        if (!file.exists(datadir)) {dir.create(datadir)}
        if (!file.exists(zipfileFullPath)) {
                download.file(powerUrl,destfile=zipfileFullPath)
                unzip(zipfileFullPath,exdir=datadir)
        } 
        
}

if(!file.exists("power.rds")) {
        get_data_files(datadir)

        powerframe<-read.table(powerdatafile,header=TRUE,sep=";",na.strings="?",
                       colClasses=c(rep("character",2),
                                    rep("numeric",7)))
                                                                                                          
        powerframe$Date<-dmy(powerframe$Date)
        powerframe$Time<-hms(powerframe$Time)
        
        #only get the subset of dates we are interested in
        powerframe<-subset(powerframe,
                   year(Date)==YEAR & 
                          month(Date)==MONTH & 
                           (day(Date)==START_DATE|day(Date)==END_DATE))

        powerframe$Combined<-power$Date+power$Time
        saveRDS(powerframe,file="power.rds")
}
#the rds files seems the best for efficiency
power <- readRDS("power.rds")
