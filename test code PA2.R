# Testing code...

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

