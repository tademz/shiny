# Read in all the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need data from two days
sdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png("plot1.png")
hist(sdata$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
