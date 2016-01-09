source("sourceFiles.R")
Sys.setlocale("LC_TIME", "English")
household_df_trunc$DateTime<-dmy_hms(household_df_trunc$DateTime,tz="UCT",truncated=3)


png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#this is plot1
with(household_df_trunc,plot(DateTime,Global_active_power,xlab="datatime",type="l"))
#this is plot2
with(household_df_trunc,plot(DateTime,Voltage,xlab="datatime",type="l"))
#this is plot3
with(household_df_trunc,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(household_df_trunc,lines(DateTime,Sub_metering_2,col="red"))
with(household_df_trunc,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",col=c("black","red","blue"),lwd=1)
#this is plot4
with(household_df_trunc,plot(DateTime,Global_reactive_power,xlab="datatime",type="l"))
dev.off()