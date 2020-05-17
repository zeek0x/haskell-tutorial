{-
data Person = Person { firstName :: String
                    , lastName :: String
                    , age :: Int
                    } deriving (Eq)
-}

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}

{-
ghci> mca == adRock
False
ghci> mikeD == adRock
False
ghci> mikeD == mikeD
True
ghci> mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}
True
ghci> let beastieByos = [mca, adRock, mikeD]
ghci> mikeD `elem` beastieByos
True
-}

data Person = Person { firstName :: String
                    , lastName :: String
                    , age :: Int
                    } deriving (Eq, Show, Read)
{-
ghci> mikeD
Person {firstName = "Michael", lastName = "Diamond", age = 43}
ghci> "mikeD is: " ++ show mikeD
"mikeD is: Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"
-}

mysteryDude = "Person { firstName =\"Michael\"" ++
                     ", lastName = \"Diamond\"" ++
                     ", age = 43}"
{-
ghci> read mysteryDude :: Person
Person {firstName = "Michael", lastName = "Diamond", age = 43}
ghci> read "Just 43" :: Maybe a

<interactive>:19:1: error:
    * No instance for (Read a1) arising from a use of `read'
      Possible fix:
        add (Read a1) to the context of
          an expression type signature:
            forall a1. Maybe a1
    * In the expression: read "Just 43" :: Maybe a
      In an equation for `it': it = read "Just 43" :: Maybe a
ghci> read "Just 43" :: Maybe Int
Just 43
-}

{-
ghci> True `compare` False
GT
ghci> True > False
True
ghci> True < False
False
-}

{-
ghci> Nothing < Just 100
True
ghci> Nothing > Just (-49999)
False
ghci> Just 3 `compare` Just 2
GT
ghci> Just 100 > Just 50
True
-}

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
    deriving (Eq, Ord, Show, Read, Bounded, Enum)

{-
ghci> Wednesday
Wednesday
ghci> show Wednesday
"Wednesday"
ghci> read "Saturday" :: Day
Saturday
ghci> Saturday == Sunday
False
ghci> Saturday == Saturday
True
ghci> Saturday > Friday
True
ghci> Monday `Compare` Wednesday
ghci> Monday `compare` Wednesday
LT
ghci> minBound :: Day
Monday
ghci> maxBound :: Day
Sunday
ghci> succ Monday
Tuesday
ghci> pred Saturday
Friday
ghci> [Thursday .. Sunday]
[Thursday,Friday,Saturday,Sunday]
ghci> [minBound .. maxBound] :: [Day]
[Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday]
-}
