import Control.Monad

{-
ghci> (*) <$> [1,2,3] <*> [10,100,1000]
[10,100,1000,20,200,2000,30,300,3000]
ghci> [3,4,5] >>= \x -> [x,-x]
[3,-3,4,-4,5,-5]
ghci> [] >>= \x -> ["bad", "mad", "rad"]
[]
ghci> [1,2,3] >>= \x -> []
[]
ghci> [1,2] >>= \n -> ['a','b'] >>= \ch -> return (n, ch)
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

listOfTuples :: [(Int, Char)]
listOfTuples = do
    n <- [1,2]
    ch <- ['a','b']
    return (n, ch)

{-
ghci> listOfTuples
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

{-
ghci> [ (n, ch) | n <- [1,2], ch <- ['a', 'b']]
[(1,'a'),(1,'b'),(2,'a'),(2,'b')]
-}

{-
ghci> [ x | x <- [1..50], '7' `elem` show x]
[7,17,27,37,47]
-}

{-
ghci> guard (5 > 2) :: Maybe ()
Just ()
ghci> guard (1 > 2) :: Maybe ()
Nothing
ghci> guard (5 > 2) :: [()]
[()]
ghci> guard (1 > 2) :: [()]
[]
-}

{-
ghci> [1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)
[7,17,27,37,47]
ghci> guard (5 > 2) >> return "cool" :: [String]
["cool"]
ghci> guard (1 > 2) >> return "cool" :: [String]
[]
-}

sevensOnly :: [Int]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = do
    (c',r') <- [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
               , (c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
               ]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c', r')

{-
moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = filter onBoard
     [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
     , (c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
     ]
     where onBoard (c, r) = c `elem` [1..8] && r `elem` [1..8]
-}

{-
in3 :: KnightPos -> [KnightPos]
in3 start = do
    first <- moveKnight start
    second <- moveKnight first
    moveKnight second
-}

in3 :: KnightPos -> [KnightPos]
in3 start = moveKnight start >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start
