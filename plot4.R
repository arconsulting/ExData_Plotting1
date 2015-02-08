plot4 <- function(dir) {
    
    ## Name:    plot4.R
    ## Purpose: Generate four charts about energy usage
    ## Author:  Aric Rosenbaum
    
    ## Clean up
    rm(list=ls())
    
    ## Load data
    data <- read.table(paste(dir, "\\household_power_consumption.txt", sep = ""), sep = ";", na.strings = "?", header = TRUE)
    
    ## Subset data (Feb 1 and Feb 2, 2007 only)
    data.subset = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## Create day of week column
    data.subset$DateTime = strptime( paste (data.subset$Date, data.subset$Time), "%d/%m/%Y %H:%M:%S")
    
    ## Set 2x2 charting matrix
    par(mfrow = c(2, 2))
    
    ## Global Active Power (top left)
    plot(data.subset$DateTime, data.subset$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    
    ## Voltage (top right)
    plot(data.subset$DateTime, data.subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    
    ## Energy sub metering (bottom left)
    with(data.subset, {
        plot(data.subset$DateTime, data.subset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
        lines(data.subset$DateTime, data.subset$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
        lines(data.subset$DateTime, data.subset$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
    })
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n")
    
    ## Voltage (bottom right)
    plot(data.subset$DateTime, data.subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    
    ## Output PNG
    dev.copy(png, file = "plot4.png", height = 480, width = 480)
    dev.off()
    
}
