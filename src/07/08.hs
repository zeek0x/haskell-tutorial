data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"

{-
ghci> Red == Red
True
ghci> Red == Yellow
False
ghci> Red `elem` [Red, Yellow, Green]
True
ghci> [Red, Yellow, Green]
[Red light,Yellow light,Green light]
-}

{-
ghci> :i Maybe
data Maybe a = Nothing | Just a         -- Defined in `GHC.Maybe'
instance Applicative Maybe -- Defined in `GHC.Base'
instance Eq a => Eq (Maybe a) -- Defined in `GHC.Maybe'
instance Functor Maybe -- Defined in `GHC.Base'
instance Monad Maybe -- Defined in `GHC.Base'
instance Semigroup a => Monoid (Maybe a) -- Defined in `GHC.Base'
instance Ord a => Ord (Maybe a) -- Defined in `GHC.Maybe'
instance Semigroup a => Semigroup (Maybe a)
  -- Defined in `GHC.Base'
instance Show a => Show (Maybe a) -- Defined in `GHC.Show'
instance Read a => Read (Maybe a) -- Defined in `GHC.Read'
instance Foldable Maybe -- Defined in `Data.Foldable'
instance Traversable Maybe -- Defined in `Data.Traversable'
-}
