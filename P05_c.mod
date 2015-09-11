Minimize
    cost: 80xwood + 30x4p + 40x3p
Subject To
    seats: x4p + x3p - 10xwood <= 500
    legs: 4x4p + 3x3p - 20xwood <= 200
    backs: x4p - 2xwood <= 100
    dem: x4p + x3p >= 1000
    times: x4p - 4x3p >= 0
Integer
    x3p
    x4p
    xwood
End