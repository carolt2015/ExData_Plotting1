#Read data
elec_df <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Convert Date format from character to date
dates_new <- as.Date(strptime(elec_df$Date, "%d/%m/%Y"))

# Subsetting the Dataframe to work with.
# We will be only using data from the dates 2007-02-01 and 2007-02-02.
date_df <- subset(elec_df,dates_new=="2007-02-01" | dates_new=="2007-02-02")

#Convert 'Global_active_power' to numeric 
df <-  transform(date_df,Global_active_power = as.numeric(Global_active_power))

#Plotting histogram for Global_active_power
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

