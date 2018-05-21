## Johns Hopkins Coursera - Exploratory Data Analysis Project 1
## Plot 4
## Goal: Using household consumption dataset, re-create 4 line graphs.

## Step 1 - Read in data from working directory.
setwd("C:/Users/shrut/datasciencecoursera/Data_Analysis")
consumption_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                             nrows=2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')

## Step 2 - Subset data to the first two days in February. Use View() to check if data was subset correctly.
consumption_data_subset <- subset(consumption_data, Date %in% c("1/2/2007", "2/2/2007"))
View(consumption_data_subset)

## Step 3 - Convert 'Date' and 'Time' fields.
consumption_data_subset$Date <- as.Date(consumption_data_subset$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(consumption_data_subset$Date), consumption_data_subset$Time)
consumption_data_subset$Datetime <- as.POSIXct(datetime)

## Step 4 - Split plotting space into four areas.
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Step 5 - Create first plot using with() function for Global Active Power.
with(consumption_data_subset, 
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
)

## Step 6 - Create second plot using with() function for Voltage. 
with(consumption_data_subset,
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "")
)

## Step 7 - Create third plot using with() function for sub metering. Color-code each sub metering line and add legend.
with(consumption_data_subset,
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = ""),
  lines(Sub_metering_2 ~ Datetime, col = "Red"),
  lines(Sub_metering_3 ~ Datetime, col = "Blue"),
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty= "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
)

## Step 8 - Create fourth plot using with() function for Global reactive power.
with(consumption_data_subset,
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_reactive_power", xlab = "")
)

## Step 9 - Create png file and close out graphics device to view. Set width and height as specified by the assignment.
png("plot3.png", width = 480, height = 480)
dev.off()