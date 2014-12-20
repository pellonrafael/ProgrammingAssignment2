source("cacheMatrix.R")

m1 <- makeCacheMatrix(matrix(c(1,2,3,4), nrow = 2))
m2 <- makeCacheMatrix(matrix(sample(1:100, 16, replace=T), nrow = 4))

i1 <- cacheSolve(m1)
i2 <- cacheSolve(m1)

m1$get() * i1 - i1 * m1$get()
m1$get() * i2 - i2 * m1$get()

i2 <- cacheSolve(m2)
cacheSolve(m2)

m2 <- makeCacheMatrix(matrix(sample(1:100, 9, replace=T), nrow = 3))
i2 <- cacheSolve(m2)
cacheSolve(m2)

m2$get() * i2 - i2 * m2$get()
