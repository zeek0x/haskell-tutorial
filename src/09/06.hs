{-
ghci> :t random
random :: (Random a, RandomGen g) => g -> (a, g)
ghci> random (mkStdGen 100)
(-3633736515773289454,693699796 2103410263)
ghci> random (mkStdGen 100) :: (Int, StdGen)
(-3633736515773289454,693699796 2103410263)
ghci> random (mkStdGen 100) :: (Int, StdGen)
(-3633736515773289454,693699796 2103410263)
ghci> random (mkStdGen 949494) :: (Int, StdGen)
(6642787099209953655,75809027 2103410263)
ghci> random (mkStdGen 949488) :: (Float, StdGen)
(0.3718226,1597344447 1655838864)
ghci> random (mkStdGen 949488) :: (Bool, StdGen)
(False,1485632275 40692)
ghci> random (mkStdGen 949488) :: (Integer, StdGen)
(9159618695640234475,587416689 2103410263)
-}

import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

{-
ghci> threeCoins (mkStdGen 943)
(True,False,True)
ghci> threeCoins (mkStdGen 944)
(True,True,True)
ghci> threeCoins (mkStdGen 21)
(True,True,True)
ghci> threeCoins (mkStdGen 22)
(True,False,True)
-}

{-
ghci> take 5 $ randoms (mkStdGen 11) :: [Int]
[5260538044923710387,4361398698747678847,-8221315287270277529,7278185606566790575,1652507602255180489]
ghci> take 5 $ randoms (mkStdGen 11) :: [Bool]
[True,True,True,True,False]
ghci> take 5 $ randoms (mkStdGen 11) :: [Float]
[0.26201087,0.1271351,0.31857032,0.1921351,0.31495118]
-}

randoms' :: (RandomGen g, Random a) => g -> [a]
random' gen = let (value, newGen) = random gen in value:randoms' newGen

finiteRandoms :: (RandomGen g, Random a, Num n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in  (value:restOfList, finalGen)

{-
ghci> :t randomR
randomR :: (Random a, RandomGen g) => (a, a) -> g -> (a, g)
ghci> randomR (1,6) (mkStdGen 359353)
(6,1494289578 40692)
ghci> randomR (1,6) (mkStdGen 35935335)
(3,1250031057 40692)
ghci> take 10 $ randomRs ('a', 'z') (mkStdGen 3) :: [Char]
"xnuhlfwywq"
-}

{-
bash-5.0$ ./random_string
ysywlwfgcuqlctdgayym
bash-5.0$ ./random_string
awldnidadsrkedfnwnvf
bash-5.0$ ./random_string
vthonvkrpedtmbehsxhd
-}

{-
bash-5.0$ ./guess_the_number
Which number in the range from 1 to 10 am I thinking of?
4
Sorry, it was 3
Which number in the range from 1 to 10 am I thinking of?
10
Sorry, it was 5
Which number in the range from 1 to 10 am I thinking of?
2
Sorry, it was 5
Which number in the range from 1 to 10 am I thinking of?
5
You are correct!
Which number in the range from 1 to 10 am I thinking of?
-}
