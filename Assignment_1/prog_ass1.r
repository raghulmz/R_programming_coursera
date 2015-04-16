
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  df<-data.frame()
  for (i in id) {
    n<-formatC(i,width=3,format="d",flag=0)
    fname<-paste("./",directory,"/",n,".csv",sep="")
    df<-rbind(df,read.csv(file=fname,header=T))
  }
  mean(df[,pollutant],na.rm = T)
}

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  odf<-data.frame()
  for (i in id) {
    df<-data.frame()
    n<-formatC(i,width=3,format="d",flag=0)
    fname<-paste("./",directory,"/",n,".csv",sep="")
    df<-read.csv(file=fname,header=T)
    df[5]<-apply(!is.na(df),1,sum)
    nobs<-length(df[which(df[5]==4),5])
    odf<-rbind(odf,c(i,nobs))
  }
  names(odf)<-c("id","nobs")
  return(odf)
}

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  #source("./")
  
  corr<-function(i){
    df<-data.frame()
    n<-formatC(i,width=3,format="d",flag=0)
    fname<-paste("./",directory,"/",n,".csv",sep="")
    df<-read.csv(file=fname,header=T)
    df[5]<-apply(!is.na(df),1,sum)
    df<-df[which(df[5]==4),]
    cor(df$sulfate,df$nitrate)
  }
  
  complete_df<-complete(directory)
  complete_df<-complete_df[which(complete_df[,2]>=threshold),]
  sapply(complete_df[,1],corr)
  
}