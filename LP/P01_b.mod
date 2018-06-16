Minimize
  cost: 12q1 + 14q2 + 16q3 + 18q4 + 2s1 + 2s2 + 2s3 + 2s4 + 1000b1 + 1000b2 + 1000b3 + 1000b4
Subject To
  d1: q1 - s1 = 100
  d2: s1 + q2 - s2 = 200
  d3: s2 + q3 - s3 = 150
  d4: s3 + q4 - s4 = 400
  l1: q1 - 400b1 <= 0
  l2: q2 - 4002 <= 0
  l3: q3 - 300b3 <= 0
  l4: q4 - 300b4 <= 0
Binary
  b1
  b2
  b3
  b4
End