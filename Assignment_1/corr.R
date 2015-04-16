
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  source("./complete.R")
  
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