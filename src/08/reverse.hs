main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main

reverseWords :: String -> String
reverseWords = unwords . map reverse .words

{-
bash-5.0$ ghc --make reverse.hs
[1 of 1] Compiling Main             ( reverse.hs, reverse.o )
Linking reverse ...
bash-5.0$ ./reverse
clean up on aisle number nine
naelc pu no elsia rebmun enin
the goat of error shines a light upon your life
eht taog fo rorre senihs a thgil nopu ruoy efil
it was all a dream
ti saw lla a maerd
-}
