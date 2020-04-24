{-
ghci> [x*2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
ghci> [x*2 | x <- [1..10], x*2 >= 12]
[12,14,16,18,20]
ghci> [x | x <- [50..100], x `mod` 7 == 2]
[51,58,65,72,79,86,93,100]
-}

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

{-
ghci> boomBangs [7..13]
["BOOM!","BOOM!","BANG!","BANG!"]
ghci> [x | x <- [10..20], x /= 13, x /= 15, x /= 19]
[10,11,12,14,16,17,18,20]
[x+y | x <- [1,2,3], y <- [10,100,1000]]
[11,101,1001,12,102,1002,13,103,1003]
ghci> [x*y | x <- [2,5,10], y <- [8,10,11]]
[16,20,22,40,50,55,80,100,110]
ghci> [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
[55,80,100,110]
ghci> let nouns = ["hobo", "frog", "pope"]
ghci> let adjectives = ["lazy","grouchy","scheming"]
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog","grouchy pope","scheming hobo","scheming frog","scheming pope"]
ghci> length' [1,2,3,4]
4
ghci> removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
ghci> removeNonUppercase "Hahaha! Ahahaha!"
"HA"
ghci> removeNonUppercase "IdontLIKEFROGS"
"ILIKEFROGS"
ghci> let xxs = [[1,3,5,2,3,1,2,4,5], [1,2,3,4,5,6,7,8,9], [1,2,4,2,1,6,3,1,3,2,3,6]]
ghci> [ [ x | x <- xs, even x ] | xs <- xxs ]
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
-}
