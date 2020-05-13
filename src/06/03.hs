import qualified Data.Map as Map
import Data.Char

-- Assoc List
{-
phoneBook =
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]
-}

{-
findKey :: (Eq k) => k -> [(k, v)] -> v
findKey key xs = snd . head . filter (\k, v) -> key == k) $ xs

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey key xs
-}

findKey :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey key [] = Nothing
findKey key xs = foldr
                    (\(k, v) acc -> if key == k then Just v else acc)
                    Nothing xs
{-
ghci> findKey "penny" phoneBook
Just "853-2492"
ghci> findKey "betty" phoneBook
Just "555-2938"
ghci> findKey "wilma" phoneBook
Nothing
-}


-- Map
{-
ghci> Map.fromList [(3,"shoes"), (4,"trees"), (9,"bess")]
fromList [(3,"shoes"),(4,"trees"),(9,"bess")]
ghci> Map.fromList [("kima","greggs"), ("jimmy","mcnulty"), ("jay","landsman")]
fromList [("jay","landsman"),("jimmy","mcnulty"),("kima","greggs")]
ghci> Map.fromList [("MS",1),("MS",2),("MS",3)]
fromList [("MS",3)]
ghci> :t Map.fromList
Map.fromList :: Ord k => [(k, a)] -> Map.Map k a
-}

{-
phoneBook :: Map.Map String String
phoneBook = Map.fromList $
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]
-}

{-
ghci> :t Map.lookup
Map.lookup :: Ord k => k -> Map.Map k a -> Maybe a
ghci> Map.lookup "betty" phoneBook
Just "555-2938"
ghci> Map.lookup "wendy" phoneBook
Just "939-8282"
ghci> Map.lookup "grace" phoneBooghci> :t Map.size
Map.size :: Map.Map k a -> Int
ghci> :t Map.insert
Map.insert :: Ord k => k -> a -> Map.Map k a -> Map.Map k a
ghci> Map.lookup "grace" phoneBook
Nothing
ghci> let newBook = Map.insert "grace" "341-9021" phoneBook
ghci> Map.lookup "grace" newBook
Just "341-9021"
ghci> :t Map.size
Map.size :: Map.Map k a -> Int
ghci> Map.size phoneBook
6
ghci> Map.size newBook
7
-}

string2digits :: String ->　[Int]
string2digits = map digitToInt . filter isDigit
{-
ghci> string2digits "948-9282"
[9,4,8,9,2,8,2]
-}

phoneBook =
    [("betty", "555-2938")
    ,("betty", "342-2492")
    ,("bonnie", "452-2928")
    ,("patsy", "943-2929")
    ,("patsy", "493-2928")
    ,("patsy", "827-9162")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ,("penny", "555-2111")
    ]

{-
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
    where add number1 number2 = number1 ++ ", " ++ number2
-}
{-
ghci> Map.lookup "patsy" $ phoneBookToMap phoneBook
Just "827-9162, 493-2928, 943-2929"
ghci> Map.lookup "wendy"$ phoneBookToMap phoneBook
Just "939-8282"
ghci> Map.lookup "betty" $ phoneBookToMap phoneBook
Just "342-2492, 555-2938"
-}

phoneBookToMap :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs
{-
ghci> Map.lookup "patsy" $ phoneBookToMap phoneBook
Just ["827-9162","493-2928","943-2929"]
ghci> Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
fromList [(2,100),(3,29),(4,22)]
ghci> Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
fromList [(2,108),(3,62),(4,37)]
-}
