
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