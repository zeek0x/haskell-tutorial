import Data.Ratio
import Control.Monad
import Data.List (all)

{-
ghci> 1%4
1 % 4
ghci> 1%2 + 1%2
1 % 1
ghci> 1%3 + 5%4
19 % 12
-}

newtype Prob a = Prob { getProb :: [(a, Rational)] } deriving Show

instance Functor Prob where
    fmap f (Prob xs) = Prob $ map (\(x,p) -> (f x, p)) xs

{-
ghci> fmap negate (Prob [(3,1%2),(5,1%4),(9,1%4)])
Prob {getProb = [(-3,1 % 2),(-5,1 % 4),(-9,1 % 4)]}
-}

thisSituation :: Prob (Prob Char)
thisSituation = Prob
    [(Prob [('a',1%2),('b',1%2)], 1%4)
    ,(Prob [('c',1%2),('d',1%2)], 3%4)
    ]

flatten :: Prob (Prob a) -> Prob a
flatten (Prob xs) = Prob $ concat $ map multAll xs
    where multAll (Prob innerxs, p) = map (\(x, r) -> (x, p*r)) innerxs

instance Applicative Prob where
    pure x = Prob [(x,1%1)]
    (<*>) = ap

instance Monad Prob where
    return x = Prob [(x,1%1)]
    m >>= f = flatten (fmap f m)
    fail _ = Prob []

data Coin = Heads | Tails deriving (Show, Eq)

coin :: Prob Coin
coin = Prob [(Heads,1%2),(Tails,1%2)]

loadedCoin :: Prob Coin
loadedCoin = Prob [(Heads,1%10),(Tails,9%10)]

flipThree :: Prob Bool
flipThree = do
    a <- coin
    b <- coin
    c <- loadedCoin
    return (all (==Tails) [a,b,c])

{-
ghci> getProb flipThree
[(False,1 % 40),(False,9 % 40),(False,1 % 40),(False,9 % 40)
,(False,1 % 40),(False,9 % 40),(False,1 % 40),(True,9 % 40)]
-}
