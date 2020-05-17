{-
import Shapes
main = do
    print $ Circle (Point 10 20) 30
-}
{-
ghci> :l Main.hs
[1 of 2] Compiling Shapes           ( Shapes.hs, interpreted )
[2 of 2] Compiling Main             ( Main.hs, interpreted )

Main.hs:3:13: error:
    Data constructor not in scope: Circle :: t0 -> Integer -> a0
  |
3 |     print $ Circle (Point 10 20) 30
  |             ^^^^^^

Main.hs:3:21: error:
    Data constructor not in scope: Point :: Integer -> Integer -> t0
  |
3 |     print $ Circle (Point 10 20) 30
  |
-}

import Shapes
main = do
    print $ nudge (baseCircle 30) 10 20
{-
ghci> :l Main
[1 of 2] Compiling Shapes           ( Shapes.hs, interpreted )
[2 of 2] Compiling Main             ( Main.hs, interpreted )
Ok, two modules loaded.
ghci> main
Circle (Point 10.0 20.0) 30.0
-}
