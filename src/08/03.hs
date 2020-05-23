{-
main = do
     putStrLn "Hello, what's your name?"
     name <- getLine
     putStrLn ("Hey " ++ name ++ ", you rock!")
-}

{-
Hello, what's your name?
yaju senpai
Hey yaju senpai, you rock!
-}

{-
ghci> :t getLine
getLine :: IO String
-}

{-
main = do
    foo <- putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn ("Hey " ++ name ++ ", you rock!")
-}

{-
import Data.Char

main = do
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "hey " ++ bigFirstName ++ " "
                      ++ bigLastName
                      ++ ", how are you?"
-}

{-
bash-5.0$ ./03
What's your first name?
yaju
What's your last name?
senpai
hey YAJU SENPAI, how are you?
-}

{-
main = do
    return ()
    return "HAHAHA"
    line <- getLine
    return "BLAH BLAH BLAH"
    return 4
    putStrLn line
-}

{-
main = do
    a <- return "hell"
    b <- return "yeah!"
    putStrLn $ a ++ " " ++ b
-}

main = do
    let a = "hell"
    let b = "yeah!"
    putStrLn $ a ++ " " ++ b
