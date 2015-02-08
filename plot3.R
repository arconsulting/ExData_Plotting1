plot3 <- function(dir) {
    
    ## Name:    plot3.R
    ## Purpose: Generate a line chart of energy sub metering
    ## Author:  Aric Rosenbaum
    
    ## Clean up
    rm(list=(ls()[ls()!="dir"]))
    
    ## Load data
    data <- read.table(paste(dir, "\\household_power_consumption.txt", sep = ""), sep = ";", na.strings = "?", header = TRUE)
    
    ## Subset data (Feb 1 and Feb 2, 2007 only)
    data.subset = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## Create day of week column
    data.subset$DateTime = strptime(paste (data.subset$Date, data.subset$Time), "%d/%m/%Y %H:%M:%S")
    
    ## Output PNG
    png("plot3.png", height = 480, width = 480)

    ## Create line chart
    with(data.subset, {
        plot(data.subset$DateTime, data.subset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
        lines(data.subset$DateTime, data.subset$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
        lines(data.subset$DateTime, data.subset$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
    })
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
    
    ## Close PNG
    dev.off()
    
}
