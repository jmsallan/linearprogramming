set N;
/* nodes */

set M;
/* nodes but one */

param n;
/* instance size */

param d{i in N, j in N};
/* distance in thousands of miles */

var x{i in N, j in N}, binary;
/* binary indicating if edge is solution */

var u{k in M}, binary;
/* variables for MTZ constraints */

minimize cost: sum{i in N, j in N} d[i,j] * x[i,j];

s.t. rows{i in N}: sum{j in N} x[i,j] = 1;

s.t. cols{j in N}: sum{i in N} x[i,j] = 1;

s.t. mzt{i in M, j in M}: u[i] - u[j] + n*x[i,j] <= n-1;

data;

set N := A B C D E;

set M := B C D E;

param n := 4;

param d:   A   B   C   D E :=
    A   900 11 97 54 88
    B   11 900 91 43 81
    C   97 91 900 89 17
    D   54 43 89 900 73
    E   88 81 17 73 900;

end;
