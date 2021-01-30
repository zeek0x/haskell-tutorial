import Control.Monad
import Control.Monad.State
import Control.Monad.Writer

type Stack = [Int]

pop :: State Stack Int
pop = get >>= \(x:xs) -> put xs >>= \_ -> return x

push :: Int -> State Stack ()
push x = get >>= \xs -> put (x:xs)

{-
ghci> liftM (*3) (Just 8)
Just 24
ghci> fmap (*3) (Just 8)
Just 24
ghci> runWriter $ liftM not $ writer (True, "chickpeas")
(False,"chickpeas")
ghci> runWriter $ fmap not $ writer (True, "chickpeas")
(False,"chickpeas")
ghci> runState (liftM (+100) pop) [1,2,3,4]
(101,[2,3,4])
ghci> runState (fmap (+100) pop) [1,2,3,4]
(101,[2,3,4])
-}

{-
ghci> (+) <$> Just 3 <*> Just 5
Just 8
ghci> (+) <$> Just 3 <*> Nothing
Nothing
ghci> Just (+3) <*> Just 4
Just 7
ghci> Just (+3) `ap` Just 4
Just 7
ghci> [(+1),(+2),(+3)] <*> [10,11]
[11,12,12,13,13,14]
ghci> [(+1),(+2),(+3)] `ap` [10,11]
[11,12,12,13,13,14]
-}

{-
ghci> join (Just (Just 9))
Just 9
ghci> join (Just Nothing)
Nothing
ghci> join Nothing
Nothing
ghci> runWriter $ join (writer (writer (1, "aaa"), "bbb"))
(1,"bbbaaa")
ghci> join (Right (Right 9)) :: Either String Int
Right 9
ghci> join (Right (Left "error")) :: Either String Int
Left "error"
ghci> join (Left "error") :: Either String Int
Left "error"
ghci> runState (join (state $ \s -> (push 10, 1:2:s))) [0,0,0]
((),[10,1,2,0,0,0])
-}

keepSmall :: Int -> Writer [String] Bool
keepSmall x
    | x < 4 = do
        tell ["Keeping " ++ show x]
        return True
    | otherwise = do
        tell [show x ++ " is too large, throwing it away"]
        return False

{-
ghci> filter (\x -> x < 4) [9,1,5,2,10,3]
[1,2,3]
ghci> fst $ runWriter $ filterM keepSmall [9,1,5,2,10,3]
[1,2,3]
ghci> mapM_ putStrLn $ snd $ runWriter $ filterM keepSmall [9,1,5,2,10,3]
9 is too large, throwing it away
Keeping 1
5 is too large, throwing it away
Keeping 2
10 is too large, throwing it away
Keeping 3
-}

powerset :: [a] -> [[a]]
powerset xs = filterM (\x -> [True, False]) xs

{-
ghci> powerset [1,2,3]
[[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
-}

binSmalls :: Int -> Int -> Maybe Int
binSmalls acc x
    | x > 9     = Nothing
    | otherwise = Just (acc + x)

{-
ghci> foldl (\acc x -> acc + x) 0 [2,8,3,1]
14
ghci> foldM binSmalls 0 [2,8,3,1]
Just 14
ghci> foldM binSmalls 0 [2,11,3,1]
Nothing
-}
