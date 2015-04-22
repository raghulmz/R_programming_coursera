# Caching the Inverse of a Matrix
####Files

* `cachematrix.R` - functions for calculating, caching and retrieving inverse
* `example.R` - Example from assignment page
##makeCacheMatrix
 **makeCacheMatrix** takes a matrix as input and returns a list of 4 functions.<br>

 * `set` clears the cached value of `inv` and the sets the data to variable `x`.
 * `get` retrives the cached value of `x`.
 * `setinv` caches the value of `inv`.
 * `getinv` retives the cached value of `inv`.

##cacheSolve
**cacheSolve** checks if there is a value for `inv` and returns it. If there is no value cached then it computes the inverse for the given matrix

###Example

```
raghulmz@thecomp <R> x = matrix(c(1:9),nrow = 3, ncol = 3)
raghulmz@thecomp <R>  x <- matrix(runif(9,1,100),3,3)
raghulmz@thecomp <R>  m = makeCacheMatrix(x)
raghulmz@thecomp <R>  m$get()
       [,1]  [,2]   [,3]
[1,] 25.628 62.65 67.665
[2,] 82.901 73.75 49.416
[3,]  7.447 79.72  7.562
raghulmz@thecomp <R>  cacheSolve(m) # Calculates inverse
           [,1]      [,2]      [,3]
[1,] -0.0110103  0.016020 -0.006167
[2,] -0.0008429 -0.001010  0.014140
[3,]  0.0197291 -0.005133 -0.010757
raghulmz@thecomp <R>  cacheSolve(m) # Gets cached inverse 
Getting cached inverse
           [,1]      [,2]      [,3]
[1,] -0.0110103  0.016020 -0.006167
[2,] -0.0008429 -0.001010  0.014140
[3,]  0.0197291 -0.005133 -0.010757
```
