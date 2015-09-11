Minimize
    2F11 + 2F12 + 2.5F22 + 2F33 + F43 + F44 + 1.5F54 + 3F61 + 1.5C11 + 1.5C12 + C22 + C23 + 2C33 + 2C34 + C43 + C44 + 2C54 + 2C51 + 2.5C61 + 2.5C62
Subject To
    fuel1: F61 + F11 >= 420
    fuel2: F12 + F22 >= 385
    fuel3: F33 + F43 >= 455
    fuel4: F44 + F54 >= 350

    corn1: C51 + C61 + C11 >= 780
    corn2: C62 + C12 + C22 >= 715
    corn3: C23 + C33 + C43 >= 845
    corn4: C34 + C44 + C54 >= 650

    prop1: F11 + F12 - 3C11 - 3C12 <= 0
    prop2: F22 - 3C22 - 3C23 <= 0
    prop3: F33 - 3C33 - 3C34 <= 0
    prop4: F43 + F44 - 3C43 - 3C44 <= 0
    prop5: F54 - 3C54 - 3C51 <= 0
    prop6: F61 - 3C61 - 3C62 <= 0
End