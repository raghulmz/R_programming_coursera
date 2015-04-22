setwd("../../..//R_Programming//R_Programming_R//Assignment_3")
list.files()
outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
names(data)

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")

state="MD"
outcome="pneumonia"
num="best"
num=6L
num="worst"


source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


outcome="heart attack"
num= 20

outcome="pneumonia"
num="worst"

head(rankall("heart attack", 20), 10)

tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)

source("./rprog-scripts-submitscript3.R")
submit()
rprog-013
raghulmz@gmail.com
T5gNDfWzT8
