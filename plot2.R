# Read in all the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Below we only need data from two days
sdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a new column with the combined date and time
sdata$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},
                         sdata$Date,sdata$Time)

png("plot2.png")
plot(sdata$datetime, sdata$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis.POSIXct(1, as.POSIXct(sdata$datetime, origin="1970-01-01"))
dev.off()
