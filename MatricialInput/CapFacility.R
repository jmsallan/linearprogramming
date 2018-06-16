#-----function to solve a transportation problem with fixed costs on the supply side----
#parameters:
#d: vector of demand of each center
#s: vector of maximum capacity of each supply center
#f: fixed costs for each supply center
#c: matrix of transportation costs from demand to supply

CapFacility <- function(d, s, f, c){
    
    #problem size
    m <- length(d)
    n <- length(s)
    
    #linear model parameters
    coef <- c(as.vector(c), f)
    rhs <- c(d, rep(0, n))
    
    Amatrix <- matrix(0, length(rhs), length(coef))
    
    for(i in 1:m){
        for(j in 1:n){
            Amatrix[i, n*(i-1)+j] <-1
        }
    }
    
    for(i in 1:n){
        for(j in 1:m){
            Amatrix[m+i, n*(j-1)+i] <- 1
        }
    }
    
    for(i in 1:n){
        Amatrix[m+i, m*n + i] <- -s[i]
    }
    
    signs <- c(rep(">=", m), rep("<=", n))
    var_type <- c(rep("C", m*n), rep("B",n))
    
    #solving the model with Rglpk
    library(Rglpk)
    
    solution <- Rglpk_solve_LP(obj=coef, mat=Amatrix, dir=signs, types=var_type, rhs=rhs, max=FALSE)
    
    #returning the solution in matrix form
    solution$solution <- solution$solution[1:(m*n)]
    dim(solution$solution) <- c(n, m)
    
    return(solution)
    
}