{-
main = do
    line <- getLine
    let line' = reverse line
    putStrLn $ "You said " ++ line' ++ "backwards!"
    putStrLn $ "Yes, you said " ++ line' ++ " backwards!"
-}

main = do
    line <- fmap reverse getLine
    putStrLn $ "You said " ++ line ++ " backwards!"
    putStrLn $ "Yes, you said " ++ line ++ " backwards!"

{-
$ runhaskell 01.hs
blah
You said halb backwards!
Yes, you said halb backwards!
-}

{-
ghci> :m + Control.Monad.Instances

<interactive>:1:1: warning: [-Wdeprecations]
    Module `Control.Monad.Instances' is deprecated:
      This module now contains no instances and will be removed in the future
ghci> :t fmap (*3) (+100)
fmap (*3) (+100) :: Num b => b -> b
ghci> fmap (*3) (+100) 1
303
ghci> (*3) `fmap` (+100) $ 1
303
ghci> (*3) . (+100) $ 1
303
ghci> fmap (show . (*3)) (+100) 1
"303"
ghci> :t fmap (*2)
fmap (*2) :: (Functor f, Num b) => f b -> f b
ghci> :t fmap (replicate 3)
fmap (replicate 3) :: Functor f => f a -> f [a]
-}

{-
ghci> :set -XNoMonomorphismRestriction
ghci> let shout = fmap (++"!")
ghci> :t shout
shout :: Functor f => f [Char] -> f [Char]
ghci> shout ["ha", "ka", "ta", "no"]
["ha!","ka!","ta!","no!"]
-}

{-
ghci> fmap (replicate 3) [1,2,3,4]
[[1,1,1],[2,2,2],[3,3,3],[4,4,4]]
ghci> fmap (replicate 3) [Just 4]
[[Just 4,Just 4,Just 4]]
ghci> fmap (replicate 3) [Right "blah"]
[[Right "blah",Right "blah",Right "blah"]]
ghci> fmap (replicate 3) Nothing
Nothing
ghci> fmap (replicate 3) (Left "foo")
Left "foo"
-}
