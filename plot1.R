plot1 <- function(dir) {
    
    ## Name:    plot1.R
    ## Purpose: Generate a graph of Global Active Power
    ## Author:  Aric Rosenbaum
    
    ## Clean up
    rm(list=(ls()[ls()!="dir"]))
    
    ## Load data
    data <- read.table(paste(dir, "\\household_power_consumption.txt", sep = ""), sep = ";", na.strings = "?", header = TRUE)
    
    ## Subset data (Feb 1 and Feb 2, 2007 only)
    data.subset = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## Output PNG
    png("plot1.png", height = 480, width = 480)

    ## Create histogram
    hist(data.subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    
    ## Close PNG
    dev.off()
    
}
