{-
$ ghci
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /home/vscode/.ghci
-}

{-
ghci> 2 + 15
17
ghci> 49 * 100
4900
ghci> 1892 - 1472
420
ghci> 5 / 2
2.5
ghci> 114 + 514
628
ghci> (50 * 100) - 4999
1
ghci> 50 * 100 - 4999
1
ghci> 50 * (100 - 4999)
-244950
ghci> True && False
False
ghci> True && True
True
ghci> False || True
True
ghci> not False
True
ghci> not (True && True)
False
ghci> 5 == 5
True
ghci> 1 == 0
False
ghci> 5 /= 5
False
ghci> 5 /= 4
True
ghci> 5 + "llama"

<interactive>:19:1: error:
    • No instance for (Num [Char]) arising from a use of ‘+’
    • In the expression: 5 + "llama"
      In an equation for ‘it’: it = 5 + "llama"
-}
