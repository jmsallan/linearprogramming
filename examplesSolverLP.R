# set wd on solvingLP.R file

source("solvinglp.R")

#entering a model with LP format
P02.sol <- SolverLP("LP/P02.mod")
P02.sol$df

#entering a model in MathProg format
prod.sol <- SolverLP("MathProg/prodAmpl.mod", method = "MathProg")
prod.sol$df
