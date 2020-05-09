import Data.List
import Data.Char

-- words
{-
ghci> words "hey these are the words in this sentence"
["hey","these","are","the","words","in","this","sentence"]
ghci> words "hey these           are    the words in this sentence"
["hey","these","are","the","words","in","this","sentence"]
ghci> group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
[[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]
ghci> group ["boom", "bip", "bip", "boom", "boom"]
[["boom"],["bip","bip"],["boom","boom"]]
ghci> sort [5,4,3,7,2,1]
[1,2,3,4,5,7]
ghci> sort ["boom", "bip", "bip", "boom", "boom"]
-}

wordNums :: String -> [(String,Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

-- needle in a heystack
{-
ghci> tails "party"
["party","arty","rty","ty","y",""]
ghci> tails [1,2,3]
[[1,2,3],[2,3],[3],[]]
ghci> "hawaii" `isPrefixOf` "hawaii joe"
True
ghci> "haha" `isPrefixOf` "ha"
False
ghci> "ha" `isPrefixOf` "ha"
True
ghci> any (> 4) [1,2,3]
False
ghci> any (=='F') "Frank Sobotka"
True
ghci> any (\x -> x > 5 && x < 10) [1,4,11]
False
-}

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)
{-
ghci> "art" `isIn` "party"
True
ghci> [1,2] `isIn` [1,3,5]
False
-}

-- Caesar cipher
{-
ghci> ord 'a'
97
ghci> chr 97
'a'
ghci> map ord "abcedfgh"
[97,98,99,101,100,102,103,104]
-}

encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg
{-
ghci> encode 3 "hey mark"
"kh|#pdun"
ghci> encode 5 "please instruct your men"
"uqjfxj%nsxywzhy%~tzw%rjs"
ghci> encode 1 "to party hard"
"up!qbsuz!ibse"
-}

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
{-
ghci> decode 3 "kh|#pdun"
"hey mark"
ghci> decode 5 "uqjfxj%nsxywzhy%~tzw%rjs"
"please instruct your men"
ghci> decode 1 "up!qbsuz!ibse"
"to party hard"
-}

-- strict fold left
{-
ghci> foldl (+) 0 (replicate 100 1)
100
ghci> foldl (+) 0 (replicate 1000000 1)
1000000
ghci> foldl (+) 0 (replicate 10000000 1)
10000000
ghci> foldl (+) 0 (replicate 100000000 1)
*** Exception: stack overflow
ghci> foldl' (+) 0 (replicate 100000000 1)
100000000
-}

-- cool number
{-
ghci> digitToInt '2'
2
ghci> digitToInt 'F'
15
ghci> digitToInt 'z'
*** Exception: Char.digitToInt: not a digit 'z'
-}

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

{-
ghci> :t find
find :: Foldable t => (a -> Bool) -> t a -> Maybe a
-}

{-
ghci> Just "hey"
Just "hey"
ghci> Just 3
Just 3
ghci> :t Just "hey"
Just "hey" :: Maybe [Char]
ghci> :t Just True
Just True :: Maybe Bool
-}

{-
ghci> find (> 4) [3,4,5,6,7]
Just 5
ghci> find odd [2,4,6,8,9]
Just 9
ghci> find (=='z') "mjolnir"
Nothing
-}

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]
{-
ghci> firstTo40
Just 49999
-}
