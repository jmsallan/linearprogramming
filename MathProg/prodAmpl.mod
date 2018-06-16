param n;
param sinic;
param cstock;

param cprod{1..n};
param demanda{1..n};
param prodmax{1..n};

var q{i in 1..n}, >=0, <=prodmax[i];
var s{i in 0..n}, >=0;

minimize cost:sum{i in 1..n}cprod[i]*q[i]+sum{i in 1..n}cstock*s[i];

subject to stockini: s[0] = sinic;
subject to limdem{i in 1..n}: s[i-1] + q[i] - s[i] = demanda[i];

data;

param n:= 12;

param sinic := 10;

param cstock := 20;

param cprod :=    1 100 2 100 3 100 4 100 5 100 6 100
                  7 150 8 150 9 150 10 150 11 150 12 150;                  

param demanda :=  1 100 2 130 3 150 4 200 5 210 6 190
                  7 180 8 250 9 150 10 130 11 130 12 180;

param prodmax := 1 190 2 190 3 190 4 190 5 190 6 190
                 7 90  8 190 9 190 10 190 11 190 12 190;

end;