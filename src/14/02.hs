{-
ghci> let f = (*5)
ghci> let g = (+3)
ghci> (fmap f g) 8
55
ghci> let f = (+) <$> (*2) <*> (+10)
ghci> f 3
19
-}

{-
addStuff :: Int -> Int
addStuff = do
    a <- (*2)
    b <- (+10)
    return (a+b)
-}

{-
ghci> addStuff 3
19
-}

addStuff :: Int -> Int
addStuff x = let
    a = (*2) x
    b = (+10) x
    in a + b
