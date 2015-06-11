#complete.R Nick R

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(directory, pattern="*.csv", full.names = TRUE)
  for (i in id) {
    #specdata <- rbind(specdata, read.csv(files[i]))
    nobs[i]<-sum(complete.cases(read.csv(files[i])))
    
  }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  #nobs[i]<-nrow(na.omit(specdata))
#  nobs<-nrow(na.omit(specdata))
  nobtable <- data.frame(cbind(id,nobs=nobs[id]))
  # Add the value to the end of the vector
# Take a look at the final vector you end up with
#  nobtable <- data.frame(cbind(id,nobs=nobs[i]))
  return(nobtable)
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}