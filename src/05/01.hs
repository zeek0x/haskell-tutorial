{-
ghci> max 4 5
5
ghci> (max 4) 5
5
ghci> :t max
max :: Ord a => a -> a -> a
-}

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

{-
ghci> let multTwoWithNine = multThree 9
ghci> multTwoWithNine 2 3
54
-}

compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)
{-
ghci> divideByTen 200
20.0
ghci> 200 / 10
20.0
ghci> (/10) 200
20.0
-}

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

{-
ghci> multThree 3 4

<interactive>:229:1: error:
    * No instance for (Show (Int -> Int)) arising from a use of `print'
        (maybe you haven't applied a function to enough arguments?)
    * In a stmt of an interactive GHCi command: print it
-}
