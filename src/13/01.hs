{-
ghci> (*) <$> Just 2 <*> Just 8
Just 16
ghci> (++) <$> Just "exdeathy" <*> Nothing
Nothing
-}
