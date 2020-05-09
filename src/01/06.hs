{-
ghci> (1, 3)
(1,3)
ghci> (3, 'a', "hello")
(3,'a',"hello")
ghci> (50, 50.4, "hello", 'b')
(50,50.4,"hello",'b')
ghci> [(1,2),(8,11,5),(4,5)]

<interactive>:24:8: error:
    * Couldn't match expected type `(a, b)'
                  with actual type `(Integer, Integer, Integer)'
    * In the expression: (8, 11, 5)
      In the expression: [(1, 2), (8, 11, 5), (4, 5)]
      In an equation for `it': it = [(1, 2), (8, 11, 5), (4, 5)]
    * Relevant bindings include
        it :: [(a, b)] (bound at <interactive>:24:1)
ghci> [(1,2),("One",2)]

<interactive>:25:3: error:
    * Could not deduce (Num [Char]) arising from the literal `1'
      from the context: Num b
        bound by the inferred type of it :: Num b => [([Char], b)]
        at <interactive>:25:1-17
    * In the expression: 1
      In the expression: (1, 2)
      In the expression: [(1, 2), ("One", 2)]
ghci> ("Christopher", "Walken", 55)
("Christopher","Walken",55)
-}

-- pair
{-
ghci> fst (8, 11)
8
ghci> fst ("Wow", False)
"Wow"
ghci> snd (8, 11)
11
ghci> snd ("Wow", False)
False
ghci> zip [1,2,3,4,5] [5,5,5,5,5]
[(1,5),(2,5),(3,5),(4,5),(5,5)]
ghci> zip [1..5] ["One", "Two", "Three", "Four", "Five"]
[(1,"One"),(2,"Two"),(3,"Three"),(4,"Four"),(5,"Five")]
ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
[(5,"im"),(3,"a"),(2,"turtle")]
ghci> zip [1..] ["apple", "orange", "cherry", "mango"]
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]
ghci> let rightTriangles = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24]
ghci> rightTriangles
[(8,6,10)]
-}
