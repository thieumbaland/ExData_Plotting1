source("sourceFiles.R")

#make plot
png(file="plot1.png",width=480,height=480)
with(household_df_trunc,hist(Global_active_power,col="red",cex.axis=0.7,main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
