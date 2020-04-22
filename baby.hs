{-
ghci> doubleMe 9
18
ghci> doubleMe 8.3
16.6
-}
doubleMe x = x + x

{-
ghci> doubleUs 4 9
26
ghci> doubleUs 2.3 34.2
73.0
ghci> doubleUs 28 88 + doubleMe 123
478
-}
doubleUs x y = doubleMe x + doubleMe y

{-
ghci> doubleSmallNumber 12
24
ghci> doubleSmallNumber 100
200
ghci> doubleSmallNumber 200
200
-}
doubleSmallNumber x = if x > 100
                        then x
                        else x*2

{-
ghci> doubleSmallNumber' 100
201
-}
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

{-
ghci> conanO'Brien
"It's a-me, Conan O'Brien"
-}
conanO'Brien = "It's a-me, Conan O'Brien"
