#Quiz 1

#setwd("~/Data_Science/Coursera/Data_Science_Specialization-John_Hopkins_University/R_Programming/R_Programming_R/Quiz_1/")

Tab=read.table("hw1_data.csv",sep=",",header=T)
head(Tab)
tail(Tab)
names(Tab)
dim(Tab)
nrow(Tab)

Tab$Ozone[47]
sum(is.na(Tab$Ozone))
mean(Tab$Ozone,na.rm=T)

Tab_sub1=Tab[which(Tab$Ozone>31&Tab$Temp>90),]
mean(Tab_sub1$Solar.R)

Tab_sub2=Tab[which(Tab$Month==6),]
mean(Tab_sub2$Temp)

Tab_sub3=Tab[which(Tab$Month==5),]
max(Tab_sub3$Ozone,na.rm = T)

Tab[1:2,]

