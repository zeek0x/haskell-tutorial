{-
ghci> :t foldl
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-}

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
{-
ghci> sum' [3,5,2,1]
11
-}

{-
ghci> :t foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-}

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
{-
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
-}

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

product':: (Num a) => [a] -> a
product' = foldl (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- scan
{-
ghci> scanl (+) 0 [3,5,2,1]
[0,3,8,10,11]
ghci> scanr (+) 0 [3,5,2,1]
[11,8,3,1,0]
ghci> scanl (flip (:)) [] [3,2,1]
[[],[3],[2,3],[1,2,3]]
-}

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1
{-
ghci> sqrtSums
131
ghci> sum (map sqrt [1..131])
1005.0942035344083
ghci> sum (map sqrt [1..130])
993.6486803921487
-}

{-
ghci> :t ($)
($) :: (a -> b) -> a -> b
ghci> f $ x = f x
ghci> sum (filter (> 10) (map (*2) [2..10]))
80
ghci> sum $ filter (> 10) ( map (*2) [2..10])
80
ghci> sum $ filter (> 10) $ map (*2) [2..10]
80
ghci> map ($ 3) [(4+), (10*), (^2), sqrt]
[7.0,30.0,9.0,1.7320508075688772]
-}
