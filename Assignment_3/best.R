best <- function(state, outcome) {
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
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data <- data[data$state == state,]
  data <- data[data[,outcome_name] != "Not Available",
               c(outcome_name,"hospital.name","state")]  
  data[,outcome_name] <- as.numeric(data[,outcome_name])
  min_death <- min(data[,outcome_name])
  best_vec <- data[data[,outcome_name] == min_death,"hospital.name"]
  sort(best_vec)
  
}