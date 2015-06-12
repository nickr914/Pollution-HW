#Pollutantmean by Nick R

pollutantmean <- function(directory, pollutant, id = 1:332) {
  specdata <- data.frame()
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory, pattern="*.csv", full.names = TRUE)
  for (i in id) {
    specdata <- rbind(specdata, read.csv(files[i]))
  }
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate"
  sum(specdata[pollutant],na.rm = TRUE) / nrow(na.omit(specdata[pollutant]))
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}