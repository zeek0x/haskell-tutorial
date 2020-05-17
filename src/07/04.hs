import Shapes

{-
data Maybe a = Nothing | Just a
ghci> Just 3 :: Maybe Int
Just 3
Just "Haha"
ghci> Just 84
Just 84
ghci> :t Just "Haha"
Just "Haha" :: Maybe [Char]
ghci> :t Just 84
Just 84 :: Num a => Maybe a
ghci> :t Nothing
Nothing :: Maybe a
ghci> Just 10 :: Mybe Double
ghci> Just 10 :: Maybe Double
Just 10.0
-}

data IntMaybe = INothing | IJust Int

data StringMaybe = SNothing | SJust String

data ShapeMaybe = ShNothing | ShJust Shape

{-
data Car = Car { company :: String
               , model :: String
               , year :: Int} deriving (Show)
tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) =
    "This " ++ c ++ " " ++ m ++ " was made in " ++ show y
-}
{-
ghci> let stang = Car {company="Ford", model="Mustan", year=1967}
ghci> tellCar stang
"This Ford Mustan was made in 1967"
-}

data Car a b c = Car { company :: a
                     , model :: b
                     , year :: c} deriving (Show)
tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company = c, model = m, year = y}) =
    "This " ++ c ++ " " ++ m ++ " was made in " ++ show y
{-
ghci> tellCar (Car "Ford" "Mustang" 1967)
"This Ford Mustang was made in 1967"
ghci> tellCar (Car "Ford" "Mustang" "neneteen sixty seven")
"This Ford Mustang was made in \"neneteen sixty seven\""
ghci> :t Car "Ford" "Mustang" 1967
Car "Ford" "Mustang" 1967 :: Num c => Car [Char] [Char] c
ghci> :t Car "Ford" "Mustang" "nineteen sixty seven"
Car "Ford" "Mustang" "nineteen sixty seven"
  :: Car [Char] [Char] [Char]
-}

data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

dotProd :: (Num a) => Vector a ->  Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i*l + j*m + k*n

vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i*m) (j*m) (k*m)

{-
Ok, two modules loaded.
ghci> Vector 3 5 8 `vplus` Vector 9 2 8
Vector 12 7 16
ghci> Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
Vector 12 9 19
ghci> Vector 3 9 7 `vmult` 10
Vector 30 90 70
ghci> Vector 4 9 5 `dotProd` Vector 9.0 2.0 4.0
74.0
ghci> Vector 2 9 3 `vmult` (Vector 4 9 5 `dotProd` Vector 9 2 4)
Vector 148 666 222
-}
