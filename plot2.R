source("sourceFiles.R")
Sys.setlocale("LC_TIME", "English")
household_df_trunc$DateTime<-dmy_hms(household_df_trunc$DateTime,tz="UCT",truncated=3)

png(file="plot2.png",height=480,width=480)
with(household_df_trunc,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
