#example of use of the CapFaciliy function 

#loading the function
source("CapFacility.R")

#model parameters (case A)

demand <- c(100, 200, 200, 150, 200)
capacity <- c(1200, 800)
fixed.costs <- c(3000, 3000)
transp.costs <- matrix(c(1,4,5,6,6,4,3,7,6,9),2,5,byrow=TRUE)

#the solution is stored in the plan variable
plan.A <- CapFacility(demand, capacity, fixed.costs, transp.costs)

#model parameters (case B)

demand.B <- c(200, 400, 300, 450, 300)
capacity <- c(1200, 800)
fixed.costs <- c(3000, 3000)
transp.costs <- matrix(c(1,4,5,6,6,4,3,7,6,9),2,5,byrow=TRUE)

plan.B <- CapFacility(demand.B, capacity, fixed.costs, transp.costs)

#model parameters (case C):non-feasible solution

demand.C <- c(200, 400, 300, 450, 300)
capacity.C <- c(1000, 600)
fixed.costs <- c(3000, 3000)
transp.costs <- matrix(c(1,4,5,6,6,4,3,7,6,9),2,5,byrow=TRUE)

#non-feasible solution: plan.C$status equals one, all other variables of plan.C zero
plan.C <- CapFacility(demand.C, capacity.C, fixed.costs, transp.costs)