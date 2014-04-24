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

    list(setMatrix = setMatrix, #return functions wrapped in a list
         getMatrix = getMatrix,
         setInvMatrix = setInvMatrix,
         getInvMatrix = getInvMatrix,
         getIdentMatrix = getIdentMatrix
         )
}

