##
## a pair of functions that cache the inverse of a matrix.
##

##
## makeCacheMatrix: Function to create a special "matrix", which is really a list containing a function to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix
## Param is a matrix and return the special object
##

makeCacheMatrix <- function(x = matrix()) {
    # initialize the inverse value
    inverse <- NULL

    # set the value of matrix
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }

    # get the value of matrix
    get <- function() x
    
    # set the inverse
    setInverse <- function(solve) inverse <<- solve

    # get the inverse
    getInverse <- function() inverse
    
    # return a list of all the functions
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## cacheSolve: Function to receive a CacheMatrix, check if inverte matrix is calculated. If it is calculated, 
## (and the matrix has not changed) it returns the inverse from cached. In other case, it is calculated and returned

cacheSolve <- function(x, ...) {
    inverse <- x$getInverse()

    # check if the inverse is cached.
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }

    # if not be cached, get the matrix
    data <- x$get()
    
    # calcule the inverse
    inverse <- solve(data)
    
    # cache the inverse
    x$setInverse(inverse)
    
    ## Return a matrix that is the inverse of 'x'
    inverse
}