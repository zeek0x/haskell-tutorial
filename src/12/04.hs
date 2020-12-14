import qualified Data.Foldable as F

{-
ghci> :t foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
ghci> :t F.foldr
F.foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-}

{-
ghci> foldr (*) 1 [1,2,3]
6
ghci> F.foldr (*) 1 [1,2,3]
6
ghci> F.foldr (+) 2 (Just 9)
11
ghci> F.foldr (||) False (Just True)
-}

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

instance F.Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

testTree = Node 5
            (Node 3
                (Node 1 EmptyTree EmptyTree)
                (Node 6 EmptyTree EmptyTree)
            )
            (Node 9
                (Node 8 EmptyTree EmptyTree)
                (Node 10 EmptyTree EmptyTree)
            )

{-
ghci> F.foldl (+) 0 testTree
42
ghci> F.foldl (*) 1 testTree
64800
-}

{-
ghci> :m Data.Monoid
ghci> getAny $ F.foldMap (\x -> Any $ x == 3) testTree
True
ghci> getAny $ F.foldMap (\x -> Any $ x > 15) testTree
False
ghci> F.foldMap (\x -> [x]) testTree
[1,3,6,5,8,9,10]
-}
