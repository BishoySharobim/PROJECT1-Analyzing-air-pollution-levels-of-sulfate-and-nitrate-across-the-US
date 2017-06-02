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