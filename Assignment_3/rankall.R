rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  
  file <- "rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"
  data <- read.csv(file,header = T)
  
  ## Check that state and outcome are valid
  
  names(data) <- sapply(names(data),tolower)
  outcome_name <- paste("hospital.30.day.death..mortality..rates.from.",
                        sub(" ",".",outcome),sep="")
  
  if(!any(names(data) == outcome_name)) {
    stop("invalid outcome")
  }
  
  if(!(num == "best"| num == "worst" | class(num) == "integer"|class(num) == "numeric")) {
    stop("invalid outcome")
  }
  
  ##typeconversion and sort
  
  data <- data[,c(outcome_name,"hospital.name","state")]  
  data[,outcome_name] <- as.numeric(data[,outcome_name])
  
  split_data <- split(data,data$state)
  
  sort_hospital <- function(x) {
    
    index <- order(x[,outcome_name],x[,"hospital.name"])
    x[index,]
  }
  
  out_mat <- sapply(split_data, sort_hospital )
  
  names_list <- list(NULL,c("hospital","state"))
  out_data <- data.frame(matrix(dimnames = names_list, ncol = 2))
  
  if(num=="worst") {
    
    for (i in colnames(out_mat)) {
      out_state <- data.frame(out_mat[,i])
      state_max  <- max(out_state[,outcome_name],na.rm = T)
      out_data[i,] <- out_state[which(out_state[,outcome_name]==state_max),-1]
    }
    return(out_data[-1,])
  }
  
  if(num=="best") {
    
    for (i in colnames(out_mat)) {
      out_state <- data.frame(out_mat[,i])
      out_data[i,] <- out_state[1,]
    }
    return(out_data[-1,])
  }
  
  if (class(num) == "integer" | class(num) == "numeric") {
    for (i in colnames(out_mat)) {
      out_state <- data.frame(out_mat[,i])
      out_data[i,] <- out_state[num,-1]
      out_data[i,2] <- i
      }
    return(out_data[-1,])
  }
  
}
