import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

{-
ghci> :m + Data.List
ghci> :m + Data.List Data.Map Data.Set
-}

{-
import Data.List (nub, sort)
-}

{-
import Data.List hiding (nub)
-}

{-
import qualified Data.Map
import qualified Data.Map as M
-}
