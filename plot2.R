plot2 <- function(dir) {
    
    ## Name:    plot2.R
    ## Purpose: Generate a graph of Global Active Power
    ## Author:  Aric Rosenbaum
    
    ## Clean up
    rm(list=(ls()[ls()!="dir"]))
    
    ## Load data
    data <- read.table(paste(dir, "\\household_power_consumption.txt", sep = ""), sep = ";", na.strings = "?", header = TRUE)
    
    ## Subset data (Feb 1 and Feb 2, 2007 only)
    data.subset = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## Create day of week column
    data.subset$DateTime = strptime( paste (data.subset$Date, data.subset$Time), "%d/%m/%Y %H:%M:%S")
    
    ## Output PNG
    png("plot2.png", height = 480, width = 480)

    ## Create line chart
    plot(data.subset$DateTime, data.subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
    
    ## Close
    dev.off()
    
}
