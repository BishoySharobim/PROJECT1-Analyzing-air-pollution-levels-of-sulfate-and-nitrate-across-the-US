
#OBJECTIVE: Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases.


#Download and unzipping the data

    {fileurl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
    
    if(!file.exists("specdata.zip")){
    download.file(url = fileurl, destfile = "specdata.zip")}
    
    if(!file.exists("specdata")){
    unzip(zipfile = "specdata.zip")}}

    
#Producing function
    
    complete <- function(directory, id = 1:332) {
          
        #Get a list of file names 
        filenames <- list.files(path=directory, pattern="*.csv")
          
        #Initialize a vector
        counts <- vector()
          
        #For loop
        for (i in id) {
            
            #Accessing the required monitor by forming a
            #string for the corresponding csv file.
            filename <- sprintf("%03d.csv", i)
            filepath <- paste(directory, filename, sep ="/")
      
            #load the data
            data <- read.csv(filepath)
      
            #Store the ids
            ids <- i
      
            ## Calculate and store the count of complete cases
            completeCases <- data[complete.cases(data),]
            counts <- c(counts, nrow(completeCases))
      
        }
    
        data.frame(id=id, nobs=counts)
    }
