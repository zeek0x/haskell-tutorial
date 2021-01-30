import Data.List

{-
ghci> let f = (+1) . (*1000)
ghci> f 4
4001
ghci> let g = (\x -> return (x+1)) <=< (\x -> return (x*100))
ghci> Just 4 >>= g
Just 40
ghci> let g = (\x -> return (x+1)) <=< (\x -> return (x*100))
ghci> Just 4 >>= g
ghci> let f = foldr (.) id [(+8),(*100),(+1)]
ghci> f 1
208
-}

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = do
    (c',r') <- [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
               , (c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
               ]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c', r')

inMany :: Int -> KnightPos -> [KnightPos]
inMany x start = return start >>= foldr (<=<)
    reutrn (replicate x moveKnight)

canReachIn :: INt -> KnightPos -> KnightPos -> Bool
canReachIn x start end = end `elem` inMany x start
