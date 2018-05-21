## Johns Hopkins Coursera - Exploratory Data Analysis Project 1
## Plot 2
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
consumption_data_subset$datetime <- strptime(paste(consumption_data_subset$Date, consumption_data_subset$Time), "%Y-%m-%d %H:%M:%S")
consumption_data_subset$datetime <- as.POSIXct(consumption_data_subset$datetime)

## Step 4 - Create plot using with() function.
with(consumption_data_subset, 
     plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
     )

## Step 5 - Create png file and close out graphics device to view. Set width and height as specified by the assignment.
png("plot2.png", width = 480, height = 480)
dev.off()