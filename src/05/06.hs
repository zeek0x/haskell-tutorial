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
