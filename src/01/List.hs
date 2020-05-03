-- Declare
{-
ghci> let lostNumbers = [4, 8, 15, 16, 23, 42]
ghci> lostNumbers
[4,8,15,16,23,42]
-}
let lostNumbers = [4, 8, 15, 16, 23, 42]

-- Concatiate
{-
ghci> [1,2,3,4] ++ [9,10,11,12]
[1,2,3,4,9,10,11,12]
ghci> "hello" ++ " " ++ "world"
"hello world"
ghci> ['w','o'] ++ ['o','t']
"woot"
ghci> 'A':" SMALL CAT"
"A SMALL CAT"
ghci> 5:[1,2,3,4,5]
[5,1,2,3,4,5]
ghci> [1,2,3,4]++[5]
[1,2,3,4,5]
ghci> [1,2,3,4]++5

<interactive>:16:1: error:
    * Non type-variable argument in the constraint: Num [a]
      (Use FlexibleContexts to permit this)
    * When checking the inferred type
        it :: forall a. (Num a, Num [a]) => [a]
-}

-- Access
{-
ghci> "Steve Buscemi" !! 6
'B'
ghci> [9.4,33.2,96.2,11.2,23.25] !! 1
33.2
ghci> [9.4,33.2,96.2,11.2,23.25] !! 5
*** Exception: Prelude.!!: index too large
-}

-- List in List
{-
ghci> let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
ghci> b
[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
ghci> b ++ [[1,1,1,1]]
[[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]
ghci> [6,6,6]:b
[[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
ghci> b !! 2
[1,2,2,3,4]
ghci>  b ++ [['B']]

<interactive>:26:1: error:
    * No instance for (Num Char) arising from a use of `b'
    * In the first argument of `(++)', namely `b'
      In the expression: b ++ [['B']]
      In an equation for `it': it = b ++ [['B']]
-}

-- Compare
{-
ghci> [3,2,1] > [2,1,0]
True
ghci> [3,2,1] > [2,10,10]
True
ghci> [3,4,2] < [3,4,3]
True
ghci> [3,4,2] > [2,4]
True
ghci> [3,4,2] == [3,4,2]
True
ghci> [] < [1]
True
-}

-- More
{-
ghci> head [5,4,3,2,1]
5
ghci> tail [5,4,3,2,1]
[4,3,2,1]
ghci> last [5,4,3,2,1]
1
ghci> init [5,4,3,2,1]
[5,4,3,2]
ghci> head []
*** Exception: Prelude.head: empty list
ghci> length [5,4,3,2,1]
5
ghci> null [1,2,3]
False
ghci> null []
True
ghci> reverse [5,4,3,2,1]
[1,2,3,4,5]
ghci> take 3 [5,4,3,2,1]
[5,4,3]
ghci> take 1 [3,9,3]
[3]
ghci> take 5 [1,2]
[1,2]
ghci> take 0 [6,6,6]
[]
ghci> drop 3 [8,4,2,1,5,6]
[1,5,6]
ghci> drop 0 [1,2,3,4]
[1,2,3,4]
ghci> drop 100 [1,2,3,4]
[]
ghci> maximum [1,9,2,3,4]
9
ghci> minimum [8,4,2,1,5,6]
1
ghci> sum [5,2,1,6,3,2,5,7]
31
ghci> product [6,2,1,2]
24
ghci> product [1,2,5,6,7,9,2,0]
0
ghci> 4 `elem` [3,4,5,6]
True
ghci> 10 `elem` [3,4,5,6]
False
-}
