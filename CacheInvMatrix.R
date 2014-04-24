makeCacheMatrix <- function( Matrix = matrix() ){ # matrix M

    ifNA(Matrix)

    invMatrix <- NULL # empty cache

    setMatrix <- function( sMatrix ){ # set M and reset cache
        message("seting matrix")
        Matrix <<- sMatrix
        invMatrix <<- NULL
    }

    getMatrix <- function() Matrix #obtain M

    setInvMatrix <- function(iMatrix) invMatrix <<- iMatrix #set M^-1

    getInvMatrix <- function() invMatrix # get M^-1

    getIdentMatrix <- function() Matrix %*% invMatrix # cross-check: get M.M^-1 = I -- identity matrix
    
    list(setMatrix = setMatrix, #return functions wrapped in a list
         getMatrix = getMatrix,
         setInvMatrix = setInvMatrix,
         getInvMatrix = getInvMatrix,
         getIdentMatrix = getIdentMatrix
         )
}


cacheSolve <- function(cMatrix){

    inv <- cMatrix$getInvMatrix() #query the inverse matrix

    if(!is.null(inv)){ #if there is a cache and return it -- no computation needed
        message("getting solution from cached data")
        return(inv)
    }

    mat <- cMatrix$getMatrix() # no cache found -- calculate the inverse matrix
    inv <- solve( mat ) # the actual solution
    cMatrix$setInvMatrix(inv) #save the result back to cMatrix's cache
    inv
}

ifNA <- function(M = matrix()){
    
    if( any( is.na(M)) ) #check if M has NAs -- give a warning
        cat( sprintf("Warning: matrix has %i NA(s)\n", sum( is.na(M) )))
    
}
