Rprog
=====

R programming

* Caching the Inverse of a Matrix

* Usage:

'''R
# load program
source("CacheInvMatrix.R")

# create matrix
m = rbind(c(1, -0.25), c(-0.25, 1))

#create cache matrix and find the inverese - cross-check with the identity matrix M.M^-1 = I
cm <- makeCacheMatrix(m)
im <- cacheSolve(cm)
imc <- cacheSolve(cm)
cm$getInvMatrix()
cm$getIdentMatrix()
 
# to avoid the intermediate step, call
cacheSetSolveMatrix(m)
'''
