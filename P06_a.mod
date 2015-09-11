Minimize
  cost: 5h1 + 5h2 + 5h3 + 5h4 + 5h5 + 5h6 + 10f1 + 10f2 + 10f3 + 10f4 + 10f5 + 10f6 + 8s1 + 8s2 + 8s3 + 8s4 + 8s5 + 8s6
Subject To
    sini: s0 = 20
    sm1: s0 + h1 - f1 - s1 = 0
    sm2: s1 + h2 - f2 - s2 = 0
    sm3: s2 + h3 - f3 - s3 = 0
    sm4: s3 + h4 - f4 - s4 = 0
    sm5: s4 + h5 - f5 - s5 = 0
    sm6: s5 + h6 - f6 - s6 = 0
Bounds
  30 <= s1
  60 <= s2
  55 <= s3
  40 <= s4
  45 <= s5
  50 <= s6
End

