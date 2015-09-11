Minimize
  cost: 3q1 + 8q2 + 6q3 + 7q4 + 2s1 + 2s2 + 2s3 + 2s4
Subject To
  d0: s0 = 200
  d1: q1 + s0 - s1 = 800
  d2: s1 + q2 - s2 = 900
  d3: s2 + q3 - s3 = 1200
  d4: s3 + q4 - s4 = 1800
  d5: s4 = 200
Bounds
  0 <= q1 <= 1300
  0 <= q2 <= 1300
  0 <= q3 <= 1300
  0 <= q4 <= 1300
End