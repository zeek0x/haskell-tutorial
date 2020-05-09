{-
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool
-}

-- Eq Type Class
{-
ghci> 5 == 5
True
ghci> 5 /= 5
False
ghci> 'a' == 'a'
True
ghci> "Ho Ho" == "Ho Ho"
True
ghci> 3.432 == 3.432
True
-}

-- Ord Type Class
{-
ghci> :t (>)
(>) :: Ord a => a -> a -> Bool
ghci> "Abrakadabra" < "Zebra"
True
ghci> "Abrakadabra" `compare` "Zebra"
LT
ghci>
ghci> 5 >= 2
True
ghci> 5 `compare` 3
GT
ghci> 'b' > 'a'
True
-}

-- Show Type Class
{-
ghci> show 3
"3"
ghci> show 5.334
"5.334"
ghci> show True
"True"
-}

-- Read Type Class
{-
ghci> read "True" || False
True
ghci> read "8.2" + 3.8
12.0
ghci> read "5" - 2
3
ghci> read "[1,2,3,4]" ++ [3]
[1,2,3,4,3]
ghci> read "4"
*** Exception: Prelude.read: no parse
ghci> :t read
read :: Read a => String -> a

-- Type Specification
ghci> read "5" :: Int
5
ghci>
ghci> read "5" :: Float
5.0
ghci> (read "5" :: Float) * 4
20.0
ghci> read "[1,2,3,4]" :: [Int]
[1,2,3,4]
ghci> read "(3, 'a')" :: (Int, Char)
(3,'a')
-}

-- Enum Type Class
{-
ghci> ['a'..'e']
"abcde"
ghci> [LT..GT]

<interactive>:116:2: error:
    Not in scope: `LT..'
    No module named `LT' is imported.

<interactive>:116:2: error:
    A section must be enclosed in parentheses thus: (LT.. GT)
ghci> [LT .. GT]
[LT,EQ,GT]
ghci> [3..5]
[3,4,5]
ghci> succ 'B'
'C'
-}

-- Bounded Type Class
{-
ghci> minBound :: Int
-9223372036854775808
ghci> maxBound :: Char
'\1114111'
ghci> maxBound :: Bool
True
ghci> minBound :: Bool
False
ghci> :t maxBound
maxBound :: Bounded a => a
-}

-- Num Type Class
{-
ghci> :t 20
20 :: Num p => p
20 :: Num p => p
ghci> 20 :: Int
20
ghci> 20 :: Integer
20
ghci> 20 :: Float
20.0
ghci> 20 :: Double
20.0
ghci> :t (*)
(*) :: Num a => a -> a -> a
<interactive>:134:15: error:
    * Couldn't match expected type `Int' with actual type `Integer'
    * In the second argument of `(*)', namely `(6 :: Integer)'
      In the expression: (5 :: Int) * (6 :: Integer)
      In an equation for `it': it = (5 :: Int) * (6 :: Integer)
ghci> 5 * (6 :: Integer)
30
-}

-- Integral Type Class
{-
ghci> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
ghci> :t length
length :: Foldable t => t a -> Int
ghci> fromIntegral (length [1,2,3,4]) + 3.2
7.2
-}
