import qualified Data.Map as Map

phoneBook :: [(String, String)]
phoneBook =
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("patsy", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
-- inPhoneBook :: String -> String -> [(String, String)] -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

type AssocList k v = [(k, v)]

-- type IntMap v = Map Int v
-- type IntMap = Map Int

type IntMap = Map.Map Int

{-
ghci> [(1,2),(3,5),(8,9)] :: AssocList Int Int
[(1,2),(3,5),(8,9)]
-}

{-
ghci> Right 20
Right 20
ghci> Left "w00t"
Left "w00t"
ghci> :t Right 'a'
Right 'a' :: Either a Char
ghci> :t Left True
Left True :: Either Bool b
-}

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
    Nothing -> Left $ "Locker " ++ show lockerNumber
                        ++ " doesn't exist!"
    Just (state, code) -> if state /= Taken
                            then Right code
                            else Left $ "Locker " ++ show lockerNumber
                                        ++ " is already taken!"
lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken, "ZD39I"))
    ,(101,(Free,  "JAH3I"))
    ,(103,(Free,  "IQSA9"))
    ,(105,(Free,  "QOTSA"))
    ,(109,(Taken, "893JJ"))
    ,(110,(Taken, "99292"))
    ]

{-
ghci> lockerLookup 101 lockers
Right "JAH3I"
ghci> lockerLookup 100 lockers
Left "Locker 100 is already taken!"
ghci> lockerLookup 102 lockers
Left "Locker 102 doesn't exist!"
ghci> lockerLookup 110 lockers
Left "Locker 110 is already taken!"
ghci> lockerLookup 105 lockers
Right "QOTSA"
-}
