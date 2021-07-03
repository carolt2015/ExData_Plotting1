#Read data
elec_df <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Convert Date format from character to date
dates_new <- as.Date(strptime(elec_df$Date,"%d/%m/%Y"))

# Subsetting the Dataframe to work with.
# We will be only using data from the dates 2007-02-01 and 2007-02-02.
date_df <- subset(elec_df,dates_new=="2007-02-01" | dates_new=="2007-02-02")

#Convert 'Global_active_power' to numeric  
df <-  transform(date_df,Global_active_power = as.numeric(Global_active_power))

#Combine 'Date' & 'Time' variable using strptime()
df$DateTime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
# Plot multiple plots 
with(df,{
  plot(DateTime,Global_active_power,type="l",xlab='',ylab="Global Active Power")
  
  plot(DateTime,Voltage,type="l",xlab='datetime',yaxt="n")
  axis(2,at=seq(234,246,2))
  
  with(df,{
    plot(DateTime,Sub_metering_1,type="l",xlab='',ylab="Energy sub metering",yaxt="n")
    lines(DateTime,Sub_metering_2,type="l",xlab='',col="red")
    lines(DateTime,Sub_metering_3,type="l",xlab='',col="blue")
    axis(2,at=seq(0,30,10))
    legend("topright",pch="___",pt.cex=1.5,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) }) 
  
  plot(DateTime,Global_reactive_power,type="l",xaxt="n",xlab='datetime',ylim=c(0.0,0.5))
})

