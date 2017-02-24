## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

# My solution 

# Date: 24.02.2017

# Title: Assignment 2

# Example 1 from the course 

makevector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

# Example 2 from the course

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

### Assignment 2

## Write the functions:

# Question 1. 
#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
In general computing matrix inversion takes a lot of time. With the help of R programming and proceeding the following steps one get get quickly results. Using fuction CacheMatrix one can calculate 
and also cache the inverse of this matrix.


# In the first question we have to create a vector proceeding with the following
# steps:

# Step 1: set the value of the vector.
# Step 2: get the value of the vector.
# Step 3: set the value of the inverse.
# Step 4: get the value of the inverse.

specialmatrix <- function(x = matrix()) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) v <<- inverse
  getinverse <- function() v
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# Question 2

# cacheSolve: using this function we can calculate the inverse of the special "matrix" returned by "specialmatrix". The following condition should be implemented: 
#If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

inverseSpecialmatrix <- function(x, ...) {
  v <- x$getinverse()
  if (!is.null(v)) {
    message("getting cached data")
    return(v)
  }
  data <- x$get()
  v <- solve(data, ...)
  x$setinverse(v)
  v
}

# Let's look at the example:
# We can create a matrix (using diag fuction) which has 10 Rows and 10 columns with 7 values in the diagonal.
# diag-> generate diagonal matrices.

creatematrix <- diag(7,10)
creatematrix

#console output:
> creatematrix <- diag(7,10)
> creatematrix
     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
[1,]    7    0    0    0    0    0    0    0    0     0
[2,]    0    7    0    0    0    0    0    0    0     0
[3,]    0    0    7    0    0    0    0    0    0     0
[4,]    0    0    0    7    0    0    0    0    0     0
[5,]    0    0    0    0    7    0    0    0    0     0
[6,]    0    0    0    0    0    7    0    0    0     0
[7,]    0    0    0    0    0    0    7    0    0     0
[8,]    0    0    0    0    0    0    0    7    0     0
[9,]    0    0    0    0    0    0    0    0    7     0
[10,]    0    0    0    0    0    0    0    0    0     7

# Now we can calculate the inverse of the matrix and see cached data.

newMatrix <- specialmatrix(creatematrix)
inverseSpecialmatrix(newMatrix)

# Console Output

> newMatrix <- specialmatrix(creatematrix)
> inverseSpecialmatrix(newMatrix)
          [,1]      [,2]      [,3]      [,4]      [,5]      [,6]      [,7]      [,8]
[1,] 0.1428571 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[2,] 0.0000000 0.1428571 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[3,] 0.0000000 0.0000000 0.1428571 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[4,] 0.0000000 0.0000000 0.0000000 0.1428571 0.0000000 0.0000000 0.0000000 0.0000000
[5,] 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571 0.0000000 0.0000000 0.0000000
[6,] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571 0.0000000 0.0000000
[7,] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571 0.0000000
[8,] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571
[9,] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[10,] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
          [,9]     [,10]
[1,] 0.0000000 0.0000000
[2,] 0.0000000 0.0000000
[3,] 0.0000000 0.0000000
[4,] 0.0000000 0.0000000
[5,] 0.0000000 0.0000000
[6,] 0.0000000 0.0000000
[7,] 0.0000000 0.0000000
[8,] 0.0000000 0.0000000
[9,] 0.1428571 0.0000000
[10,] 0.0000000 0.1428571


