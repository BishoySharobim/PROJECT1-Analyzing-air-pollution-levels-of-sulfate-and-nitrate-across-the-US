
#OBJECTIVE: Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.


#Download and unzipping the data

    {fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
        
    if(!file.exists("specdata.zip")){
    download.file(url = fileurl, destfile = "specdata.zip")}
        
    if(!file.exists("specdata")){
    unzip(zipfile = "specdata.zip")}}

    
#Creating function
    
    pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        #Get a list of file names
        file.names <- list.files(path = directory, pattern = "*.csv" )
         
        #Create a vector to hold values
        vals <- vector()
        
            #For loop
            for (i in id) {
            
                #Accessing the required monitor by forming a    
                #string for the corresponding csv file.
                filename <- sprintf("%03d.csv", i)
                filepath <- paste(directory, filename, sep="/")
                
                data <- read.csv(filepath)
                  
                #Accessing the required pollutant and removing NAs
                d <- data[, pollutant]
                d <- d[!is.na(d)]
                
                #Append all the results to the vector
                vals <- c(vals, d)
            }
    
    #Produce the means of the values
    mean(vals)
    }