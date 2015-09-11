#------------------lpSolveAPI example 1 from book------------

library(lpSolveAPI)

prod <- make.lp(0, 2)
set.objfn(prod, c(20, 60))
lp.control(prod, sense="max")
add.constraint(prod, c(30, 20), "<=", 2700)
add.constraint(prod, c(5, 10), "<=", 850)
add.constraint(prod, c(1, 1), ">=", 95)
rownames(prod) <- c("WH", "MH", "PM")
colnames(prod) <- c("P1", "P2")

prod.solAPI <- solve(prod)
get.objective(prod)
get.variables(prod)
get.constraints(prod)

plot.lpExtPtr(prod)

#------------------lpSolve example 1 from book------------

library(lpSolve)

#defining parameters

obj.fun <- c(20, 60)
constr <- matrix(c(30, 20, 5, 10, 1, 1), ncol = 2, byrow=TRUE)
constr.dir <- c("<=", "<=", ">=")
rhs <- c(2700, 850, 95)

#solving model

prod.sol <- lp("max", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

#accessing to R output

prod.sol$obj.val
prod.sol$solution
prod.sol$duals #includes duals of constraints and reduced costs of variables
prod.sol$duals.from
prod.sol$duals.to
prod.sol$sens.coef.from
prod.sol$sens.coef.to

#--------------lpSolve example 2 from book--------

#origins run i in 1:m
#destinations run j in 1:n

obj.fun <- c(8, 6, 3, 2, 4, 9)

m <- 2
n <- 3

constr <- matrix(0, n+m, n*m)

for(i in 1:m){
    for(j in 1:n){
        constr[i, n*(i-1) + j] <- 1
        constr[m+j, n*(i-1) + j] <- 1
    }
}

constr.dir <- c(rep("<=", m), rep(">=", n))

rhs <- c(70, 40, 40, 35, 25)

prod.trans <- lp("min", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

prod.trans$obj.val
sol <- matrix(prod.trans$solution, m, n, byrow=TRUE)
prod.trans$duals
prod.trans$duals.from
prod.trans$duals.to
prod.trans$sens.coef.from
prod.trans$sens.coef.to

#------------function showing ordered results of lpSolve------

format.lpsolve <- function(fn, obj, constr, constr.dir, rhs, var.names, const.names){
    library(lpSolve)
    
    lpsol <- lp(fn, obj, constr, constr.dir, rhs, compute.sens=TRUE)
    
    var.df <- data.frame(lpsol$solution, lpsol$sens.coef.from, lpsol$sens.coef.to)
    const.df <- data.frame(lpsol$duals, lpsol$duals.from, lpsol$duals.to)
    const.df <- const.df[1:length(constr.dir), ]
    rownames(var.df) <- var.names
    rownames(const.df) <- const.names
    colnames(var.df) <- c("solution", "obj. coef lb", "obj. coef ub")
    colnames(const.df) <- c("duals", "rhs lb", "rhs ub")
    
    return(list(vars = var.df, const = const.df))
}

sol <- format.lpsolve("max", obj.fun, constr, constr.dir, rhs, c("P1", "P2"), c("WH", "MH", "PM"))


#----------lpSolve-----------------------


library(lpSolve)
#
# Set up problem: maximize
# x1 + 9 x2 + x3 subject to
# x1 + 2 x2 + 3 x3 <= 9
# 3 x1 + 2 x2 + 2 x3 <= 15
#
f.obj <- c(1, 9, 1)
f.con <- matrix (c(1, 2, 3, 3, 2, 2), nrow=2, byrow=TRUE)
f.dir <- c("<=", "<=")
f.rhs <- c(9, 15)
#
# Now run.
#
lp ("max", f.obj, f.con, f.dir, f.rhs)
## Not run: Success: the objective function is 40.5
lp ("max", f.obj, f.con, f.dir, f.rhs)$solution
## Not run: [1] 0.0 4.5 0.0
#
# The same problem using the dense constraint approach:
#
f.con.d <- matrix (c(rep (1:2,each=3), rep (1:3, 2), t(f.con)), ncol=3)
lp ("max", f.obj, , f.dir, f.rhs, dense.const=f.con.d)
## Not run: Success: the objective function is 40.5
# Get sensitivities
#
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$sens.coef.from
## Not run: [1] -1e+30 2e+00 -1e+30
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$sens.coef.to
## Not run: [1] 4.50e+00 1.00e+30 1.35e+01
#
# Right now the dual values for the constraints and the variables are
# combined, constraints coming first. So in this example...
#
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals
## Not run: [1] 4.5 0.0 -3.5 0.0 -10.5
#
# ...the duals of the constraints are 4.5 and 0, and of the variables,
# -3.5, 0.0, -10.5. Here are the lower and upper limits on these:
#
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals.from
## Not run: [1] 0e+00 -1e+30 -1e+30 -1e+30 -6e+00
lp ("max", f.obj, f.con, f.dir, f.rhs, compute.sens=TRUE)$duals.to
## Not run: [1] 1.5e+01 1.0e+30 3.0e+00 1.0e+30 3.0e+00
#
# Run again, this time requiring that all three variables be integer
#
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)
## Not run: Success: the objective function is 37
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3)$solution
## Not run: [1] 1 4 0
#
# You can get sensitivities in the integer case, but they're harder to
# interpret.
#
lp ("max", f.obj, f.con, f.dir, f.rhs, int.vec=1:3, compute.sens=TRUE)$duals
## Not run: [1] 1 0 0 7 0
#
# Here's an example in which we want more than one solution to a problem
# in which all variables are binary: the 8-queens problem,
# with dense constraints.
#
chess.obj <- rep (1, 64)
q8 <- make.q8 ()
chess.dir <- rep (c("=", "<"), c(16, 26))
chess.rhs <- rep (1, 42)
lp ('max', chess.obj, , chess.dir, chess.rhs, dense.const = q8,
    all.bin=TRUE, num.bin.solns=3)

