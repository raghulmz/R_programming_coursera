setwd(Coursera)
getwd()

library("swirl")
swirl()

#

#Lesson 2

getwd()
ls()
x<-9
ls()
dir()
?list.files
args(list.files)
old.dir<-getwd()
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
list.files()
file.exists("mytest.R")
file.info("mytest.R")
file.rename("mytest.R","mytest2.R")
file.remove("mytest2.R")
file.copy("mytest2.R","mytest3.R")
file.path("mytest3.R")
file.path("folder1","folder2")

?dir.create
dir.create(file.path("testdir2","testdir3"),recursive = TRUE)
unlink("testdir2",recursive = TRUE)
setwd(old.dir)
unlink("testdir", recursive = TRUE)

#Lesson 3

1:20
pi:10
15:1
?":"
seq(1,20)
seq(0,10,by=0.5)
my_seq<-seq(5,10,length=30)
length(my_seq)
1:length(my_seq)
seq(along.with = my_seq)
seq_along(my_seq)

rep(0, times= 40)
rep(c(0,1,2),times=10)
rep(c(0,1,2),each=10)

# Lesson 4

num_vect<-c(0.5,55,-10,6)
tf<- num_vect < 1
tf

num_vect>=6

my_char<-c("My","name","is")
my_char
paste(my_char,collapse = " ")
my_name<-c(my_char,"Raghul")
my_name
paste(my_name,collapse = " ")
paste("Hello","world!",sep=" ")
paste(1:3,c("X","Y","Z"),sep="")
paste(LETTERS,1:4,sep = "-")

#Lesson 5

x<-c(44,NA,5,NA)
x*3
y <- rnorm(1000)
z <- rep(NA,1000)
my_data<-sample(c(y,z), 100)
my_na<-is.na(my_data)
my_na
my_data == NA
sum(my_na)
my_data
0/0
Inf-Inf

#Lesson 6
x
x[1:10]
x[is.na(x)]
y<-x[!is.na(x)]
y
y[y>0]
x[x>0]
x[!is.na(x) & x>0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2,-10)]
x[-c(2,10)]

vect<-c(foo=11,bar=2,norf=NA)
vect
names(vect)
vect2<-c(11,2,NA)
names(vect2)<- c("foo","bar","norf")
identical(vect,vect2)
vect["bar"]
vect[c("foo","bar")]

#Lesson 7

my_vector<-1:20
my_vector
dim(my_vector)
length(my_vector)
dim(my_vector)<-c(4,5)
dim(my_vector)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix<-my_vector

?matrix
my_matrix2<-matrix(c(1:20),nrow=4,ncol=5)
identical(my_matrix,my_matrix2)
patients<-c("Bill","Gina","Kelly","Sean")
cbind(patients,my_matrix)

my_data<-data.frame(patients,my_matrix)
my_data
class(my_data)
cnames<-c("patient","age","weight","bp","rating","test")
colnames(my_data)<-cnames

#Lesson 8

TRUE==TRUE
(FALSE==TRUE) == FALSE
6==7
!(5==7)

TRUE || c(TRUE, FALSE, FALSE)
TRUE | c(TRUE, FALSE, FALSE)

TRUE && c(TRUE, FALSE, FALSE)
TRUE & c(TRUE, FALSE, FALSE)

isTRUE(6 > 4)
xor(5==6,!FALSE)

ints<-sample(10)
ints
ints>5

which(ints>7)

all(ints>0)

#Lesson 9

Sys.Date()

mean(c(2,4,5))

#Lesson 10

head(flags)
dim(flags)
class(flags)
cls_list<-lapply(flags,class)
cls_list
class(cls_list)
as.character(cls_list)
cls_vect<-sapply(flags,class)
class(cls_vect)


sum(flags$orange)
flag_colors<-flags[,11:17]
head(flag_colors) 
lapply(flag_colors,sum)
sapply(flag_colors,sum)
sapply(flag_colors,mean)
flags_shapes<-flags[,19:23]
flag_shapes<-flags[,19:23]
shape_mat<-sapply(flag_shapes,range)
shape_mat

unique()
unique_vals<-lapply(flags,unique)
unique_vals
sapply(unique_vals,length)
sapply(flags,unique)

lapply(unique_vals, function(elem) elem[2])


#Lesson 11

sapply(flags,unique)
vapply(flags, unique, numeric(1))
sapply(flags,class)
vapply(flags,class,character(1))
table(flags$landmass)
table(flags$animate)
