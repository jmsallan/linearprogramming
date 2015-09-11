setwd("~/Dropbox/VOS/01-Sources/LP/JMSL")

CapFacility <- function(d, s, f, c){
    m <- length(d)
    n <- length(s)
    
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
    
    library(Rglpk)
    
    solution <- Rglpk_solve_LP(obj=coef, mat=Amatrix, dir=signs, types=var_type, rhs=rhs, max=FALSE)
    
    return(solution)
    
}

d <- c(100, 200, 200, 150, 200)

s <- c(1200, 800)

f <- c(3000, 3000)

CapFacility(d, s, f, c)
