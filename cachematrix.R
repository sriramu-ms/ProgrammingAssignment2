

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function (y) {
      x <<- y
      m <<- NULL
      
    }
  
    setInverse <- function (inverse) m <<- solve
    getInverse <- function () m
    list ( set = set ,get = get,
           setInverse = setInverse,
           getInverse = getInverse)
    
}





cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if (!is.null (m) ) {
     message("cached data available .. please wait")
     return (m)
     
  }
  data <- x$get()
  m <- solve(data , ...)
  x$setInverse (m)
  m
  
  
}


