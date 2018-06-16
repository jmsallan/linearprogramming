Minimize
    2F11 + 2F12 + 2.5F22 + 2F33 + F43 + F44 + 1.5F54 + 3F61 + 1.5C1 + C2 + 2C3 + C4 + 2C5 + 2.5C6 + 1.125D1 + 0.75D2 + 1.5D3 + 0.75D4 + 1.5D5 + 1.875D6
Subject To
    vars1: C1 + D1 - C11 - C12 = 0
    vars2: C2 + D2 - C22 - C23 = 0
    vars3: C3 + D3 - C33 - C34 = 0
    vars4: C4 + D4 - C43 - C44 = 0
    vars5: C5 + D5 - C54 - C51 = 0
    vars6: C6 + D6 - C61 - C62 = 0

    fuel1: F61 + F11 >= 420
    fuel2: F12 + F22 >= 385
    fuel3: F33 + F43 >= 455
    fuel4: F44 + F54 >= 350

    corn1: C51 + C61 + C11 >= 780
    corn2: C62 + C12 + C22 >= 715
    corn3: C23 + C33 + C43 >= 845
    corn4: C34 + C44 + C54 >= 650

    prop1: F11 + F12 - 3C1 - 3D1 <= 0
    prop2: F22 - 3C2 - 3D2 <= 0
    prop3: F33 - 3C3 - 3D3 <= 0
    prop4: F43 + F44 - 3C4 - 3D4 <= 0
    prop5: F54 - 3C5 - 3D5 <= 0
    prop6: F61 - 3C6 - 3D6 <= 0

    des01: D1 - 1000B1 >= 0
    des02: D2 - 1000B2 >= 0
    des03: D3 - 1000B3 >= 0
    des04: D4 - 1000B4 >= 0
    des05: D5 - 1000B5 >= 0
    des06: D6 - 1000B6 >= 0

    Ces01: C1 + 1000B1 <= 1000
    Ces02: C2 + 1000B2 <= 1000
    Ces03: C3 + 1000B3 <= 1000
    Ces04: C4 + 1000B4 <= 1000
    Ces05: C5 + 1000B5 <= 1000
    Ces06: C6 + 1000B6 <= 1000

    Des01: D1 - 10000B1 <= 0
    Des02: D2 - 10000B2 <= 0
    Des03: D3 - 10000B3 <= 0
    Des04: D4 - 10000B4 <= 0
    Des05: D5 - 10000B5 <= 0
    Des06: D6 - 10000B6 <= 0

Binary
    B1
    B2
    B3
    B4
    B5
    B6
End