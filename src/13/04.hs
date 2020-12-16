type Birds = Int
type Pole = (Birds, Birds)

{-
landLeft :: Birds -> Pole -> Pole
landLeft n (left, right) = (left + n, right)
-}

{-
landRight :: Birds -> Pole -> Pole
landRight n (left, right) = (left, right + n)
-}

{-
ghci> landLeft 2 (0, 0)
(2,0)
ghci> landRight 1 (1, 2)
(1,3)
ghci> landRight (-1) (1, 2)
(1,1)
ghci> landLeft 2 (landRight 1 (landLeft 1 (0, 0)))
(3,1)
-}

x -: f = f x

{-ghci> 100 -: (*3)
300
ghci> True -: not
False
ghci> (0, 0) -: landLeft 2
(2,0)
-}

{-
ghci> (0, 0) -: landLeft 1 -: landRight 1 -: landLeft 2
(3,1)
ghci> (0, 0) -: landLeft 1 -: landRight 4 -: landLeft (-1) -: landRight (-2)
(0,2)
-}

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise                    = Nothing

{-
ghci> landLeft 2 (0, 0)
Just (2,0)
ghci> landLeft 10 (0, 3)
Nothing
ghci> return (0, 0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)
Nothing
-}

banana :: Pole -> Maybe Pole
banana _ = Nothing

{-
ghci> return (0, 0) >>= landLeft 1 >>= banana >>= landRight 1
Nothing
ghci> Nothing >> Just 3
Nothing
ghci> Just 3 >> Just 4
Just 4
ghci> Just 3 >> Nothing
Nothing
ghci> return (0, 0) >>= landLeft 1 >> Nothing >>= landRight 1
Nothing
-}

routine :: Maybe Pole
routine = case landLeft 1 (0, 0) of
    Nothing -> Nothing
    Just pole1 -> case landRight 4 pole1 of
        Nothing -> Nothing
        Just pole2 -> case landLeft 2 pole2 of
            Nothing -> Nothing
            Just pole3 -> landLeft 1 pole3
