# makeCacheMatrix takes a matrix as input and returns a 
# list of 4 functions.
# set clears the cached value of inv and the sets the data 
# to variable x.
# get retrives the cached value of x.
# setinv caches the value of inv.
# getinv retives the cached value of inv.

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set <- function(y) {
    x<<-y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(getinv = getinv, setinv=setinv, get=get, set=set)
}

# Cachesolve checks if there is a value for inv
# and returns it. If there is no value cached then it 
# computes the inverse for the given matrix

cacheSolve <- function(x, ...) {
  inv  <- x$getinv()
  if (!is.null(inv)) {
    message("Getting cached inverse")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat)
  x$setinv(inv)
  inv
}

