{-
bash-5.0$ ./baabaa
Baa, baa, black sheep
Have you any wool?
Yes, sir, yes, sir,
Three bags full;
-}

import System.IO
import Data.Char

main = do
    contents <- readFile "baabaa.txt"
    writeFile "baabaacaps.txt" (map toUpper contents)
