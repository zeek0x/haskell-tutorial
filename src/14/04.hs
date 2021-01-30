{-
ghci> :t Right 4
Right 4 :: Num b => Either a b
ghci> :t Left "out of cheese error"
Left "out of cheese error" :: Either [Char] b
-}

{-
ghci> :m Control.Monad.Error

<interactive>:1:1: warning: [-Wdeprecations]
    Module ‘Control.Monad.Error’ is deprecated:
      Use "Control.Monad.Except" instead
ghci> :t strMsg

<interactive>:1:1: warning: [-Wdeprecations]
    In the use of ‘strMsg’
    (imported from Control.Monad.Error, but defined in Control.Monad.Trans.Error):
    Deprecated: "Use Control.Monad.Trans.Except instead"
strMsg :: Error a => String -> a
ghci> strMsg "boom!" :: String

<interactive>:12:1: warning: [-Wdeprecations]
    In the use of ‘strMsg’
    (imported from Control.Monad.Error, but defined in Control.Monad.Trans.Error):
    Deprecated: "Use Control.Monad.Trans.Except instead"
"boom!"
-}

{-
ghci> Left "boom" >>= \x -> return (x+1)
Left "boom"
ghci> Left "boom" >>= \x -> Left "no way!"
Left "boom"
ghci> Right 100 >>= \x -> Left "no way!"
Left "no way!"
ghci> Right 3 >>= \x -> return (x + 100)
Right 103
ghci> Right 3 >>= \x -> return (x + 100) :: Either String Int
Right 103
-}
