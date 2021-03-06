## The calculation of Inverse of a Matrix is a computation intensive affair.
## Below are two functions to cache the value of Matrix Inverse and retrieve 
## the same from the cache instead of calculating it repeatedly.

## This function creates a special "matrix" object that can cache its inverse.
## This object is a list containing the functions to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
	inv<- x$getinverse()
	if(!is.null(inv)) {
			message("Inverse already exists! Getting cached data..")
			return(inv)
	}
	x_new <- x$get()
	inv<- solve(x_new, ...)
	x$setinverse(inv)
	inv
}
