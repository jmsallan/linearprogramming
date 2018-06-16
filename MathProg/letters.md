#Stacking of graded papers problem

*I would like to thank Wayne Smith for proposing this problem*

Let’s suppose that we have a set of graded papers, which have to be sorted alphabetically to be delivered to students, so that we have a vector *m* of length 26, whose components are equal to the number of papers corresponding to students of the same initial in the family name. We have to stack the papers in *n* bins, so that the number of papers of each bin are as evenly distributed as possible.

A way to tackle this problem using ILP is to minimize the difference between the maximum and minimum number of papers in each bin. Then variables such as x_{ij} can be defined which equal one if students with family name starting with letter *j* go to bin *i* and zero otherwise (so we cannot split papers with the same initial across two bins). Then we have the following sets of constraints:

* constraints to obtain the maximum and minimum
* each letter goes in one bin
* letters must be set in order

Here is an implementation of the problem in MathProg syntax using four bins. I have used data from the distribution of initials of English family names I have found somewhere. The implementation can be found for convenience in the file `letters.mod`.

```
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
```

The result of solving this problem with `glpsol` is (information about constraints has been omitted for clarity:

```
Problem:    distr5   
Rows:       135   
Columns:    106 (104 integer, 104 binary)   
Non-zeros:  672   
Status:     INTEGER OPTIMAL   
Objective:  z = 436 (MINimum)   

   No. Column name       Activity     Lower bound   Upper bound
------ ------------    ------------- ------------- -------------
     1 x[1,1]       *              1             0             1 
     2 x[2,1]       *              0             0             1 
     3 x[3,1]       *              0             0             1 
     4 x[4,1]       *              0             0             1 
     5 x[1,2]       *              1             0             1 
     6 x[2,2]       *              0             0             1 
     7 x[3,2]       *              0             0             1 
     8 x[4,2]       *              0             0             1 
     9 x[1,3]       *              1             0             1 
    10 x[2,3]       *              0             0             1 
    11 x[3,3]       *              0             0             1 
    12 x[4,3]       *              0             0             1 
    13 x[1,4]       *              1             0             1 
    14 x[2,4]       *              0             0             1 
    15 x[3,4]       *              0             0             1 
    16 x[4,4]       *              0             0             1 
    17 x[1,5]       *              0             0             1 
    18 x[2,5]       *              1             0             1 
    19 x[3,5]       *              0             0             1 
    20 x[4,5]       *              0             0             1 
    21 x[1,6]       *              0             0             1 
    22 x[2,6]       *              1             0             1 
    23 x[3,6]       *              0             0             1 
    24 x[4,6]       *              0             0             1 
    25 x[1,7]       *              0             0             1 
    26 x[2,7]       *              1             0             1 
    27 x[3,7]       *              0             0             1 
    28 x[4,7]       *              0             0             1 
    29 x[1,8]       *              0             0             1 
    30 x[2,8]       *              1             0             1 
    31 x[3,8]       *              0             0             1 
    32 x[4,8]       *              0             0             1 
    33 x[1,9]       *              0             0             1 
    34 x[2,9]       *              1             0             1 
    35 x[3,9]       *              0             0             1 
    36 x[4,9]       *              0             0             1 
    37 x[1,10]      *              0             0             1 
    38 x[2,10]      *              1             0             1 
    39 x[3,10]      *              0             0             1 
    40 x[4,10]      *              0             0             1 
    41 x[1,11]      *              0             0             1 
    42 x[2,11]      *              1             0             1 
    43 x[3,11]      *              0             0             1 
    44 x[4,11]      *              0             0             1 
    45 x[1,12]      *              0             0             1 
    46 x[2,12]      *              0             0             1 
    47 x[3,12]      *              1             0             1 
    48 x[4,12]      *              0             0             1 
    49 x[1,13]      *              0             0             1 
    50 x[2,13]      *              0             0             1 
    51 x[3,13]      *              1             0             1 
    52 x[4,13]      *              0             0             1 
    53 x[1,14]      *              0             0             1 
    54 x[2,14]      *              0             0             1 
    55 x[3,14]      *              1             0             1 
    56 x[4,14]      *              0             0             1 
    57 x[1,15]      *              0             0             1 
    58 x[2,15]      *              0             0             1 
    59 x[3,15]      *              1             0             1 
    60 x[4,15]      *              0             0             1 
    61 x[1,16]      *              0             0             1 
    62 x[2,16]      *              0             0             1 
    63 x[3,16]      *              1             0             1 
    64 x[4,16]      *              0             0             1 
    65 x[1,17]      *              0             0             1 
    66 x[2,17]      *              0             0             1 
    67 x[3,17]      *              1             0             1 
    68 x[4,17]      *              0             0             1 
    69 x[1,18]      *              0             0             1 
    70 x[2,18]      *              0             0             1 
    71 x[3,18]      *              1             0             1 
    72 x[4,18]      *              0             0             1 
    73 x[1,19]      *              0             0             1 
    74 x[2,19]      *              0             0             1 
    75 x[3,19]      *              0             0             1 
    76 x[4,19]      *              1             0             1 
    77 x[1,20]      *              0             0             1 
    78 x[2,20]      *              0             0             1 
    79 x[3,20]      *              0             0             1 
    80 x[4,20]      *              1             0             1 
    81 x[1,21]      *              0             0             1 
    82 x[2,21]      *              0             0             1 
    83 x[3,21]      *              0             0             1 
    84 x[4,21]      *              1             0             1 
    85 x[1,22]      *              0             0             1 
    86 x[2,22]      *              0             0             1 
    87 x[3,22]      *              0             0             1 
    88 x[4,22]      *              1             0             1 
    89 x[1,23]      *              0             0             1 
    90 x[2,23]      *              0             0             1 
    91 x[3,23]      *              0             0             1 
    92 x[4,23]      *              1             0             1 
    93 x[1,24]      *              0             0             1 
    94 x[2,24]      *              0             0             1 
    95 x[3,24]      *              0             0             1 
    96 x[4,24]      *              1             0             1 
    97 x[1,25]      *              0             0             1 
    98 x[2,25]      *              0             0             1 
    99 x[3,25]      *              0             0             1 
   100 x[4,25]      *              1             0             1 
   101 x[1,26]      *              0             0             1 
   102 x[2,26]      *              0             0             1 
   103 x[3,26]      *              0             0             1 
   104 x[4,26]      *              1             0             1 
   105 ma                       2761             0               
   106 mi                       2325             0               

Integer feasibility conditions:

KKT.PE: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
```

Then, according to the obtained solution, graded papers can be conveniently stored in four stacks:

* Letters A to D
* Letters E to K
* Letters L to R
* Letters S to Z

The MathProg implementation can be modified conveniently to adjust to any letter distribution.



