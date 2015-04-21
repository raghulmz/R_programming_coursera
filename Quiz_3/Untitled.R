library("datasets")
data(iris)

names(iris)
mean(
  iris[which(iris$Species=="virginica"),"Sepal.Length"],
  na.rm=T
  )

apply(iris[, 1:4], 2, mean)

data(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)

mean_by_cyl <- tapply(mtcars$hp, mtcars$cyl, mean)
abs(diff(mean_by_cyl[c("4","8")]))

debug(ls)

