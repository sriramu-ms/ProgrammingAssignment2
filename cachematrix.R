# Defines a new object with defined methods for adding , reading the matrix variables
# Stores the inverse of a matrix so that multiple calls can just fetch the
# stored value.
# Object name : makeCacheMatrix
# variable : Matrix whose inverse is sought frequently
# methods : get() - get the value of the input matrix
#         : setInverse() - sets the value of the inverse in the object
#         : getInverse gets the value of the inverse.
# All methods are stored as lists to enable the operator $ (x$get())


makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function (y) {
      x <<- y
      m <<- NULL
      m<<- NULL
      
    }
    get <- function() x
  
    setInverse <- function (inverse) m <<- solve
    getInverse <- function () m
    list ( set = set ,get = get,
           setInverse = setInverse,
           getInverse = getInverse)
    # test script below
}



# This Object finds out if the Inverse is already calculated. Searches in the cache. 
# If true , writes the 
# message given below and gives the inverse value. 
# If not , it calls Solve() function of R and stores it


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if (!is.null (m) ) {
     message("cached data available .. please wait")
     m
     
  }
  data <- x$get()
  m <- solve(data , ...)
  x$setInverse (m)
  m
  
  
}


# Testing code...
testcode <- function () {}

A <- matrix (c(4,3,3,2) , nrow =2 , ncol=2 , byrow=TRUE)
B <- matrix (c(1,2,3,4) , nrow =2 , ncol=2 , byrow=TRUE)
C <- matrix (c(1,2,3,0,4,5,1,0,6) , nrow = 3, ncol=3, byrow= TRUE)
D <- matrix (c(1,2,3,0,1,4,5,6,0) , nrow = 3,ncol=3 , byrow= TRUE)

E <- matrix ( c(4,7,2,6) , nrow = 2 , ncol = 2, byrow = TRUE)
G <- matrix ( c(3,3.5,3.2,3.6) ,nrow = 2, ncol=2, byrow=TRUE)


inplist <- list(A,B,C,D,E, G)

f1 <-  function (x) { 
  m <- makeCacheMatrix()  
  m$set(x)
  m
}

cachelist <- lapply (inplist , f1)


# read all values

lapply (cachelist, f1 <- function (x) x$get())


lapply (cachelist, cacheSolve)

lapply (cachelist, cacheSolve)

}


