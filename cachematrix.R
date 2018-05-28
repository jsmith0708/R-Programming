## In this example we introduce the <<- operator which can be used to assign a 
## value to an object in an environment that is different from the current environment. 
## Below are two functions that are used to create a special object that stores a numeric vector and cache's its mean.

## Caching the inverse of a matrix. 

makeCacheMatrix <- function(x = matrix()) {
  jef <- NULL
  set <- function(y) {
    x <<- y
    jef <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) jef <<- inverse
  getInverse <- function() jef
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The following function calculates the mean of the special "vector" created with the above function. 
## However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. 
## Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  jef <- x$getInverse()
  if (!is.null(jef)) {
    message("hello data")
    return(jef)
  }
  mat <- x$get()
  jef <- solve(mat, ...)
  x$setInverse(jef)
  jef
}
