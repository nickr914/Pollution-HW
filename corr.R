#corr.R Nick R

corr <- function(directory = "specdata", threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  corrs <- numeric(0)
  
  # Get data from complete.R 
  source("complete.R")
  specData <- complete("specdata")
  
  # Apply threshold
  specData <- specData[specData$nobs > threshold, ]
  
  # get monitor data for IDs greater than threshold 
  for (nid in nobsData$id) {
    monData <- getmonitor(nid, directory)
    corrs <- c(corrs, cor(monData$sulfate, monData$nitrate,use = "complete.obs"))
  }
  return(corrs)
}

getmondata<- function(id, directory) {
  # List files within the directory matching the csv extension.
  files <- list.files(directory,pattern="*.csv", full.names = TRUE)
  # Read the raw data in, using the id(s) from above 
  for (i in id) {
    rawData<-read.csv(files[i])
    
  }
  
  return(rawData)
}
