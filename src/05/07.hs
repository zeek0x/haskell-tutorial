{-
ghci> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
ghci> f . g = \x -> f (g x)
-}

{-
ghci> map (\x -> negate (abs x)) [5, -3, -6, 7 -3, 2, -19, 24]
[-5,-3,-6,-4,-2,-19,-24]
ghci> map (negate . abs) [5, -3, -6, 7 -3, 2, -19, 24]
[-5,-3,-6,-4,-2,-19,-24]
ghci> map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
[-14,-15,-27]
ghci> map (negate . sum . tail) [[1..5],[3..6],[1..7]]
[-14,-15,-27]
-}

{-
ghci> sum (replicate 5 (max 6.7 8.9))
44.5
ghci> (sum . replicate 5) (max 6.7 8.9)
44.5
ghci> sum . replicate 5 $ max 6.7 8.9
44.5
ghci> sum $ replicate 5 $ max 6.7 8.9
44.5
-}

{-
ghci> replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
[180,180]
ghci> replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]
[180,180]
-}

{-
sum' :: (Num a) => [a] -> a
sum' foldl (+) 0
-}
sum' :: (Num a) => [a] -> a
sum' foldl (+) 0

{-
fn x = (ceiling (negate (tan (cos (max 50 x)))))
-}
fn = ceiling . negate . tan . cos . max 50

{-
oddSquareSum :: Integer
oddSuqareSum = sum (takeWhile (<1000) (filter odd (map (^2) [1..])))
-}
oddSquareSum :: Integer
oddSuqareSum = sum . takeWhile (<1000) . filter odd $ map (^2) [1..]
