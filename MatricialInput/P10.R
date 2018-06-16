library(Rglpk)

fin <- read.csv("P10data.csv",sep=";",header=TRUE)

#defining the objective function 

fin <- fin[,2:13]/12
for(i in 1:12) fin[,i] <- fin[,i]*i

int <- fin[,12:1]

f.obj <- c(t(int[1,]),t(int[2,]),t(int[3,]),rep(0,11))

l <- length(f.obj)

f.obj <- c(f.obj,rep(0,12*2))

#defining types of variables 

types <- c(rep("C",l),rep("B",12*2))

#defining constraints
mat1 <- matrix(0,nrow=12,ncol=length(f.obj))

for(i in 1:12){
  mat1[i,c(i,12+i,24+i)] <- 1
  if(i>1) mat1[i,l+i-1-11] <- -1
  if(i<12) mat1[i,l+i-11] <- 1
}

f.rhs1 <- c(rep(3500,12))
f.dir1 <- rep("==",12)

#binary variables constraints (greater of equal)
mat2 <- matrix(0,nrow=12*2,ncol=length(f.obj))

for(i in 1:(12*2)){
  mat2[i,i+12] <- 1
  if(i<=12) mat2[i,i+l] <- -4000
  if(i>12) mat2[i,i+l] <- -20000  
}

f.rhs2 <- c(rep(0,12*2))
f.dir2 <- rep(">=",12*2)

#binary variables constraints (lesser or equal) 
M=1000000

mat3 <- matrix(0,nrow=12*2,ncol=length(f.obj))

for(i in 1:(12*2)){
  mat3[i,c(12+i)] <- 1
  mat3[i,l+i] <- -M
}

f.rhs3 <- c(rep(0,12*2))
f.dir3 <- rep("<=",12*2)

#binding all constraints 
f.con <- rbind(mat1,mat2,mat3)
f.rhs <- c(f.rhs1,f.rhs2,f.rhs3)
f.dir <- c(f.dir1,f.dir2,f.dir3)

#solving model with Rglpk 
lp_fin <- Rglpk_solve_LP(f.obj, f.con, f.dir, f.rhs, max=TRUE, types=types)

#----solution---- 

#variables p 
lp_fin$solution[1:12]

#variables q
lp_fin$solution[13:24]

#variables r
lp_fin$solution[25:36]

#variables s
lp_fin$solution[37:47]

#variables b
lp_fin$solution[48:59]

#variables c
lp_fin$solution[60:71]

#value of objective function
lp_fin$optimum
