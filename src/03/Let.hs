cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in  sideAre + 2 * topArea

{-
ghci> 4 * (let a = 9 in a + 1) + 2
42
ghci> [let square x = x * x in (square 5, square 3, square 2)]
[(25,9,4)]
ghci> (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar="there!" in foo ++ bar)
(6000000,"Hey there!")
ghci> (let (a, b, c) = (1, 2, 3) in a+b+c) * 100
600
-}

caclBmis :: [(Dboule, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bim = w / h ^ 2, bmi > 25.0]

{-
ghci> let zoot x y z = x * y + z
ghci> zoot 3 9 2
29
ghci> let boot x y z = x * y + z in boot 3 4 2
14
ghci> boot

<interactive>:197:1: error:
    * Variable not in scope: boot
    * Perhaps you meant `zoot' (line 191)
-}
