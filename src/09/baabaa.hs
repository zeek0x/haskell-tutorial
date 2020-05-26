{-
import System.IO

main = do
    handle <- openFile "baabaa.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
-}

{-
import System.IO

main = do
    withFile "baabaa.txt" ReadMode $ \handle -> do
        contents <- hGetContents handle
        putStr contents
-}

{-
import System.IO

main = do
    contents <- readFile "baabaa.txt"
    putStr contents
-}
