## These two functions in combination can be used to store matrices and their inverses, so that the inverse
## of a matrix is not recalculated if it has been computed earlier.

## The function makeCacheMatrix takes a regular matrix x and adds caching functionality.
## The matrix and its inverse can be read using the functions get and getinverse respectively.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(i) inv <<- i
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The function cacheSolve returns the inverse of a matrix created using makeCacheMatrix.
## If the inverse has been previously computed, it won't be recomputed but instead taken from the cache.

cacheSolve <- function(x) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  matrx <- x$get()
  inv <- solve(matrx)
  x$setinverse(inv)
  inv
}