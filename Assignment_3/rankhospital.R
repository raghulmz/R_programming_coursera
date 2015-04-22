rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  
  file <- "rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"
  data <- read.csv(file,header = T)
  
  ## Check that state and outcome are valid
  
  names(data) <- sapply(names(data),tolower)
  if(!any(data$state == state)) {
    stop("invalid state")
  }
  
  outcome_name <- paste("hospital.30.day.death..mortality..rates.from.",
                        sub(" ",".",outcome),sep="")
  if(!any(names(data) == outcome_name)) {
    stop("invalid outcome")
  }
  
  if(!(num == "best"| num == "worst" | class(num) == "integer"|class(num) == "numeric")) {
    stop("invalid outcome")
  }
  
  ## Choose state, remove NAs, typeconversion and sort
  data <- data[data$state == state,]
  data <- data[data[,outcome_name] != "Not Available",
               c(outcome_name,"hospital.name","state")]  
  data[,outcome_name] <- as.numeric(data[,outcome_name])
  data <- data[order(data[,outcome_name],data[,"hospital.name"]),]
  data$rank <- 1:nrow(data)
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  ifelse(num == "best",
         ret <- data[data$rank == 1,],
         ifelse(num == "worst",
                ret <- data[data$rank == nrow(data),],
                ifelse(num > nrow(data),
                       return(NA),
                       ret <- data[data$rank == num,]
                       )
                )
        )
  ret$hospital.name
}
