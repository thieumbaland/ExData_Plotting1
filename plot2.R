#please see plot1.R to find out how we saved the .RData file that is called here
Sys.setlocale("LC_TIME", "English")
load(file="household_data_trunc.RData")
household_df_trunc$DateTime<-dmy_hms(household_df_trunc$DateTime,tz="UCT",truncated=3)

png(file="plot2.png",height=480,width=480)
with(household_df_trunc,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
