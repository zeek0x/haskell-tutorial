bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you"
    | bmi <= normal = "You're supposedly normal. Pffft, Ibet you're ugly"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- not work
{-
greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Frenando" = niceGreeting ++ " Fernado!"
greet name = badGreeting ++ " " ++ name
    where niceGreeting = "Hello! So very nice to seeyou,"
          badGreeting = "Oh! Pfft. It's you!"
-}

badGreeting :: String
badGreeting = "Oh! Pfft. It's you!"

niceGreeting :: String
niceGreeting = "Hello! So very nice to seeyou,"

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernado!"
greet name = badGreeting ++ " " ++ name

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [1] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

caclBmis :: [(Dboule, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2
