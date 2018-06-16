setwd("~/Dropbox/VOS/01-Sources/LP/JMSL")

n <- 50

set.seed(1)
c <- matrix(sample(1:1000, n*n, replace=TRUE), n, n)

Assignment01 <- function(c){
    
    n <- dim(c)[1]
    
    coef <- as.vector(t(c))
    
    rhs <- rep(1, 2*n)
    
    Amatrix <- matrix(0, 2*n, n*n)
    
    for(i in 1:n){
        for(j in 1:n){
            Amatrix[i, n*(i-1)+j] <-1
        }
    }
    
    for(i in 1:n){
        for(j in 1:n){
            Amatrix[n+i, n*(j-1)+i] <- 1
        }
    }
    
    signs <- rep("==", 2*n)
    
    var_type <- rep("B", 2*n)
    
    library(Rglpk)
    
    solution <- Rglpk_solve_LP(obj=coef, mat=Amatrix, dir=signs, types=var_type, rhs=rhs, max=TRUE)
    
    matrix(solution$solution[1:(n*n)], n, n, byrow=TRUE)
}

Assignment02 <- function(c){
    
    n <- dim(c)[1]
    
    coef <- c(rep(0,n*n), 1)
    
    rhs <- c(rep(1, 2*n), rep(0, n))
    
    Amatrix <- matrix(0, 3*n, n*n + 1)
    
    for(i in 1:n){
        for(j in 1:n){
            Amatrix[i, n*(i-1)+j] <-1
        }
    }
    
    for(i in 1:n){
        for(j in 1:n){
            Amatrix[n+i, n*(j-1)+i] <- 1
        }
    }
    
    for(i in 1:n){
        for(j in 1:n){
            Amatrix[2*n+i, n*(j-1)+i] <- c[j, i]
        }
    }
    
    for(i in 1:n){
        Amatrix[2*n+i, n*n + 1] <- -1
    }
    
    signs <- c(rep("==", 2*n), rep(">=", n))
    
    var_type <- c(rep("B", n*n), "C")
    
#     library(Rglpk)
    
#     solutionPL <- Rglpk_solve_LP(obj=coef, mat=Amatrix, dir=signs, types=var_type, rhs=rhs, max=TRUE)
    
    library(Rsymphony)
    
    solutionPL <- Rsymphony_solve_LP(obj=coef, mat=Amatrix, dir=signs, types=var_type, rhs=rhs, max=TRUE)
    
    
    matrix(solutionPL$solution[1:(n*n)], n, n, byrow=TRUE)
    
}


solAss01 <- Assignment01(c)

solAss02 <- Assignment02(c)

solAss01

solAss02
