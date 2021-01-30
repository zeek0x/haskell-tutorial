import Control.Monad.State
import System.Random

{-
threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen''
    in  (firstCoin, secondCoin, thirdCoin)
-}

type Stack = [Int]

{-
pop :: Stack -> (Int, Stack)
pop (x:xs) = (x, xs)

push :: Int -> Stack -> ((), Stack)
push a xs = ((), a:xs)
-}

{-
stackManip :: Stack -> (Int, Stack)
stackManip stack = let
    ((), newStack1) = push 3 stack
    (a,  newStack2) = pop newStack1
    in pop newStack2
-}

{-
ghci> stackManip [5,8,2,1]
(5,[8,2,1])
-}

{-
stackManip :: Stack -> (Int, Stack)
stackManip = do
    push 3
    a <- pop
    pop
-}

{-
pop :: State Stack Int
pop = state $ \(x:xs) -> (x, xs)

push :: Int -> State Stack ()
push a = state $ \xs -> ((), a:xs)
-}

stackManip :: State Stack Int
stackManip = do
    push 3
    a <- pop
    pop

{-
ghci> runState stackManip [5,8,2,1]
(5,[8,2,1])
-}

stackStuff :: State Stack ()
stackStuff = do
    a <- pop
    if a == 5
        then push 5
        else do
            push 3
            push 8

{-
ghci> runState stackStuff [9,0,2,1,0]
((),[8,3,0,2,1,0])
-}

moreStack :: State Stack ()
moreStack = do
    a <- stackManip
    if a == 100
        then stackStuff
        else return ()

stackyStack :: State Stack ()
stackyStack = do
    stackNow <- get
    if stackNow == [1,2,3]
        then put [8,3,1]
        else put [9,2,1]

{-
ghci> runState stackyStack [1,1,1]
((),[9,2,1])
ghci> runState stackyStack [1,2,3]
((),[8,3,1])
-}

{-
pop :: State Stack Int
pop = do
    (x:xs) <- get
    put xs
    return x

    03.hs:100:5: error:
    • No instance for (MonadFail Data.Functor.Identity.Identity)
        arising from a do statement
        with the failable pattern ‘(x : xs)’
    • In a stmt of a 'do' block: (x : xs) <- get
      In the expression:
        do (x : xs) <- get
           put xs
           return x
      In an equation for ‘pop’:
          pop
            = do (x : xs) <- get
                 put xs
                 return x
    |
100 |     (x:xs) <- get
    |
-}

pop :: State Stack Int
pop = get >>= \(x:xs) -> put xs >>= \_ -> return x

push :: Int -> State Stack ()
push x = get >>= \xs -> put (x:xs)

-- push x = do
--     xs <- get
--     put (x:xs)

randomSt :: (RandomGen g, Random a) => State g a
randomSt = state random

threeCoins :: State StdGen (Bool, Bool, Bool)
threeCoins = do
    a <- randomSt
    b <- randomSt
    c <- randomSt
    return (a, b, c)

{-
ghci> runState threeCoins (mkStdGen 33)
((True,False,True),StdGen {unStdGen = SMGen 17473681083660280586 3174492301114349737})
-}
