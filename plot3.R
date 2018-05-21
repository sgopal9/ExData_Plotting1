## Johns Hopkins Coursera - Exploratory Data Analysis Project 1
## Plot 3
## Goal: Using household consumption dataset, re-create line graph.

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
consumption_data_subset$datetime <- as.POSIXct(datetime)

## Step 4 - Create plot using with() function for Sub_metering_1.
with(consumption_data_subset, 
     plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = ""),
     lines(Sub_metering_2 ~ datetime, col = "Red"),
     lines(Sub_metering_3 ~ datetime, col = "Blue")
    )

## Step 6 - Add a legend.
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Step 7 - Create png file and close out graphics device to view. Set width and height as specified by the assignment.
png("plot3.png", width = 480, height = 480)
dev.off()
