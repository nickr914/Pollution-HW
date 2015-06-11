#Pollutantmean by Nick R

specdata <- data.frame()

pollutantmean <- function(directory, pollutant = "nitrate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory, pattern="*.csv", full.names = TRUE)
  for (i in id) {
    specdata <- rbind(specdata, read.csv(files[i]))
  }
    ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate"
  # print(specdata[pollutant])
  #mean(specdata[pollutant], na.rm = TRUE)
  #print(sum(na.omit(specdata[pollutant])))
  #mean(na.omit(specdata[pollutant]))
  sum(specdata[pollutant],na.rm = TRUE) / nrow(na.omit(specdata[pollutant]))
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
}