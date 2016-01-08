#load packages
library(readr)
library(magrittr)
library(dplyr)
library(lubridate)

#load data
household_data <- read.csv(file="data/household_power_consumption.txt",sep=";",header=T,stringsAsFactors = F)
#process data
household_df<-tbl_df(household_data)
household_df$Date<-dmy(household_df$Date)
household_df$Time<-hms(household_df$Time)
household_df_trunc<-dplyr::filter(household_df,Date>"2007-01-31" & Date<"2007-02-03")

cols = c(3:ncol(household_df_trunc));    
household_df_trunc[,cols] = apply(household_df_trunc[,cols], 2, function(x) as.numeric(as.character(x)))
#make plot
png(file="plot1.png",width=480,height=480)
with(household_df_trunc,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
