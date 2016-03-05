param m;
/* number of letters */

param n;
/* number of bins */

param list{j in 1..m};
/*frequency of each letter */

var x{i in 1..n, j in 1..m}, binary;
/*equals one if letter j goes on bin i and zero otherwise */

var ma >=0;
var mi >=0;
/* maximum and minimum number of items in any bin */

minimize z: ma - mi;
/* minimize difference between max and min number of items */

s.t. ass{j in 1..m}: sum{i in 1..n} x[i, j] = 1;
/* each letter goes only in one bin */

s.t. mini{i in 1..n}: sum{j in 1..m} list[j] * x[i, j] - mi >=0;
s.t. maxi{i in 1..n}: sum{j in 1..m} list[j] * x[i, j] - ma <=0;
/*obtaining maximum and minimum in any bin */

s.t. order{i in 1..n, j in 2..m}: sum{k in 1..i} x[k, j-1] - x[i,j] >= 0; 
/*if letter j goes in bin i, letter j-1 must go in same bin or previous ones */

data;

param m:= 26;

param n:= 4;

param list:= 1 375
2 896
3 638
4 565
5 203
6 363
7 534
8 559
9 76
10 136
11 570
12 524
13 828
14 213
15 163
16 527
17 26
18 480
19 1093
20 388
21 47
22 255
23 346
24 2
25 65
26 129;

end;

