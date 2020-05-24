{-
main = do
    putStr "Hey, "
    putStr "I'm "
    putStrLn "Andy!"
-}
{-
Hey, I'm Andy!
-}

{-
main = do
    putChar 't'
    putChar 'e'
    putChar 'h'
-}
{-
teh
-}

{-
putStr ::String -> IO ()
putStr [] = return ()
putStr (x:xs) = do
    putChar x
    putStr xs
-}

{-
main = do
    print True
    print 2
    print "haha"
    print 3.2
    print [3,4,3]
-}
{-
True
2
"haha"
3.2
[3,4,3]
-}

{-
ghci> 3
3
ghci> print 3
3
ghci> map (++"!") ["hey","ho","woo"]
["hey!","ho!","woo!"]
ghci> print $ map (++"!") ["hey","ho","woo"]
["hey!","ho!","woo!"]
-}

{-
import Control.Monad

main = do
    input <- getLine
    when (input == "SWORDFISH") $ do
        putStrLn input
-}
{-
bash-5.0$ ./04
SWORDFISH
SWORDFISH
bash-5.0$ ./04
SANDFISH
bash-5.0$
-}

{-
main = do
    input <- getLine
    if (input == "SWORDFISH")
        then putStrLn input
        else return ()
-}

{-
main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print [a,b,c]
-}

{-
main = do
    rs <- sequence [getLine, getLine, getLine]
    print rs
-}
{-
bash-5.0$ ./04
a
b
c
["a","b","c"]
-}

{-
ghci> sequence $ map print [1,2,3,4,5]
1
2
3
4
5
[(),(),(),(),()]
-}

{-
import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l
-}
{-
bash-5.0$ ./04
Chocolate
Give me some input: CHOCOLATE
Candy
Give me some input: CANDY
^CGive me some input:
-}

{-
import Control.Monad

main = do
    colors <- forM [1,2,3,4] $ \a -> do
        putStrLn $ "Which color do you associate with the number "
                   ++ show a ++ "?"
        color <- getLine
        return color
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors
-}
{-
bash-5.0$ ./04
Which color do you associate with the number 1?
white
Which color do you associate with the number 2?
blue
Which color do you associate with the number 3?
red
Which color do you associate with the number 4?
orange
The colors that you associate with 1, 2, 3 and 4 are:
white
blue
red
orange
-}
