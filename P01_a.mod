Minimize
  cost: 12q1 + 14q2 + 16q3 + 18q4 + 2s1 + 2s2 + 2s3 + 2s4
Subject To
  d1: q1 - s1 = 100
  d2: s1 + q2 - s2 = 200
  d3: s2 + q3 - s3 = 150
  d4: s3 + q4 - s4 = 400
Bounds
  0 <= q1 <= 400
  0 <= q2 <= 400
  0 <= q3 <= 300
  0 <= q4 <= 300
End