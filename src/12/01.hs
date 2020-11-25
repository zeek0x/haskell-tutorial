{-
ghci> [(+1),(*100),(*5)] <*> [1,2,3]
[2,3,4,100,200,300,5,10,15]
ghci> :m Control.Applicative
ghci> getZipList $ ZipList [(+1),(*100),(*5)] <*> ZipList [1,2,3]
[2,200,15]
-}

{-
data Profession = Fighter | Archer | Accountant
data Race = Human | Elf | Orc | Goblin
data PlayerCharacter = PlayerCharacter Race Profession
-}

{-
ghci> newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)
ghci> CharList "this will be shown!"
CharList {getCharList = "this will be shown!"}
ghci> CharList "benny" == CharList "benny"
True
ghci> CharList "benny" == CharList "oisters"
False
-}

newtype Pair b a = Pair { getPair :: (a, b) }
instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)

{-
ghci> getPair $ fmap (*100) (Pair (2, 3))
(200,3)
ghci> getPair $ fmap reverse (Pair ("london calling",3 ))
("gnillac nodnol",3)
-}

-- data CoolBool = CoolBool { getCoolBool :: Bool }

helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"

{-
ghci> helloMe undefined
"*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries/base/GHC/Err.hs:78:14 in base:GHC.Err
  undefined, called at <interactive>:16:9 in interactive:Ghci1
-}

newtype CoolBool = CoolBool { getCoolBool :: Bool }

{-
ghci> helloMe undefined
"hello"
-}

type IntList = [Int]

{-
ghci> ([1,2,3] :: IntList) ++ ([1,2,3] :: [Int])
[1,2,3,1,2,3]
-}

newtype CharList = CharList { getCharList :: [Char]}


