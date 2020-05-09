lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5!"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
{-
ghci> charName 'a'
"Albert"
ghci> charName 'b'
"Broseph"
ghci> charName 'h'
"*** Exception: src/03/PatternMatch.hs:(18,1)-(20,22): Non-exhaustive patterns in function charName
-}

-- Tuple PatternMatch
{-
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)
-}
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
{-
addVectors
  :: (Double, Double) -> (Double, Double) -> (Double, Double)
-}

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- List PatternMatch And List Comprehension
{-
ghci> let xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]
ghci> [a+b | (a, b) <- xs]
[4,7,6,8,11,4]
ghci> [x*100+3 | (x, 3) <- xs]
[103,403,503]
-}

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
{-
ghci> head' [4,5,6]
4
ghci> head' "Hello"
'H'
-}

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first tow elements are: " ++ show x ++ " and " ++ show y
{-
ghci> tell [1]
"The list has one element: 1"
ghci> tell [True, False]
"The list has two elements: True and False"
ghci> tell [1,2,3,4]
"This list is long. The first tow elements are: 1 and 2"
ghci> tell []
"The list is empty"
-}

badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z
{-
ghci> badAdd [100, 200]
*** Exception: src/03/PatternMatch.hs:87:1-29: Non-exhaustive patterns in function badAdd

-}

-- as Pattern
firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
{-
ghci> firstLetter "Dracula"
"The first letter of Dracula is D"
-}
