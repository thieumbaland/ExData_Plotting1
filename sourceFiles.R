#load packages
library(readr)
library(magrittr)
library(dplyr)
library(lubridate)

#load data
household_data <- read.csv(file="data/household_power_consumption.txt",sep=";",header=T,stringsAsFactors = F)
#process data
household_df<-tbl_df(household_data)
household_df$DateTime<-paste(household_df$Date," ",household_df$Time,sep="")
household_df$Date<-dmy(household_df$Date)
household_df$Time<-hms(household_df$Time)
date_lb<-"2007-02-01"
date_ub<-"2007-02-03"
household_df_trunc<-household_df[household_df$Date<date_ub & household_df$Date>=date_lb,]
cols = c(3:(ncol(household_df_trunc)-1));    
household_df_trunc[,cols] = apply(household_df_trunc[,cols], 2, function(x) as.numeric(as.character(x)))

save(household_df_trunc,file="household_data_trunc.RData")