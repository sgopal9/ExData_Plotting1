## Johns Hopkins Coursera - Exploratory Data Analysis Project 1
## Plot 1
## Goal: Using household consumption dataset, re-create histogram displaying active power for two days in February.

## Step 1 - Read in data from working directory.
setwd("C:/Users/shrut/datasciencecoursera/Data_Analysis")
setwd("C:/Users/shrut/datasciencecoursera/Data_Analysis")
consumption_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                             nrows=2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')

## Step 2 - Subset data to the first two days in February. Use View() to check if data was subset correctly.
consumption_data_subset <- subset(consumption_data, Date %in% c("1/2/2007", "2/2/2007"))
View(consumption_data_subset)

## Step 3 - Convert 'Date' field into the date class.
consumption_data_subset$Date <- as.Date(consumption_data_subset$Date, format = "%d/%m/%Y")

## Step 4 - Create the histogram using R's base plot. 
## 'Main' sets the title of the plot, 'col' sets the color, and 'lab' sets labels for x and y axis.
hist(consumption_data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", 
     ylab = "Frequency", col = "red")

## Step 5 - Create png file and close out graphics device to view. Set width and height as specified by the assignment.
png("plot1.png", width = 480, height = 480)
dev.off()