# haskell-tutorial

すごいHaskellたのしく学ぼう！ の写経

## 環境

- VSCode
- https://github.com/hmemcpy/haskell-hie-devcontainer

## 9章 System.Random パッケージインストール

```console
$ nix-env -iA nixpkgs.binutils-unwrapped
$ cabal update
$ cabal install --lib random
```

## 12章 foldr

すごいHaskellたのしく学ぼう！記載

```haskell
ghci> :t foldr
foldr :: (a -> b -> b) -> b -> [a] -> b
ghci> :t F.foldr
F.foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
```

ghc version 8.6.5

```haskell
ghci> :t foldr
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
ghci> :t F.foldr
F.foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
```

GHC 7.10 から Foldable の畳み込み関数が Prelude の畳み込み関数となった。
（厳密にはちょっと違うみたい）

参考：https://wiki.haskell.org/Foldable_Traversable_In_Prelude


## 第14章 モノイドがたすけにきたよ

すごいHaskellたのしく学ぼう！記載

```haskell
ghci> B.pack [99,104,105] `mappend` B.pack [104,117,97,104,117,97]
Chunk "Chi" (Chunk "huahua" Empty)
```

ghc version 8.6.5

```haskell
ghci> B.pack [99,104,105] `mappend` B.pack [104,117,97,104,117,97]
"chihuahua"
```

原因はわからなかったが、Bianryの扱いが変わったのだろうか


## 第14章 差分リストを使う

記載通りだと以下のエラーが発生する

```haskell
01.hs:164:10: error:
    • No instance for (Semigroup (DiffList a))
        arising from the superclasses of an instance declaration
    • In the instance declaration for ‘Monoid (DiffList a)’
    |
164 | instance Monoid (DiffList a) where
    |
```

以下を追加することにより動作する

```haskell
instance Semigroup (DiffList a) where
  (DiffList f) <> (DiffList g) = DiffList (\xs -> f (g xs))
```

参考：https://stackoverflow.com/questions/53622428/a-basic-monoid-definition-gives-no-instance-for-semigroup-mymonoid-arising-fr


## 第14章 差分リストを使う

すごいHaskellたのしく学ぼう！記載

```haskell
gcd' a b
    | b == 0 = do
        tell (toDiffList ["Finished with " ++ show a])
        return a
    | otherwise = do
        result <- gcdReverse' b (a `mod` b)
        tell (toDiffList [show a ++ " mod " ++ show b ++
                          " = " ++ show (a `mod` b)])
        return result

{-
ghci> mapM_ putStrLn . fromDiffList . snd . runWriter $ gcdReverse 100 34
Finished with 2
32 mod 2 = 0
34 mod 32 = 2
100 mod 34 = 32
-}
```

以下の記載にすると動作する

```haskell
gcdReverse' :: Int -> Int -> Writer (DiffList String) Int
gcdReverse' a b
    | b == 0 = do
        tell (toDiffList ["Finished with " ++ show a])
        return a
    | otherwise = do
        result <- gcdReverse' b (a `mod` b)
        tell (toDiffList [show a ++ " mod " ++ show b ++
                          " = " ++ show (a `mod` b)])
        return result

{-
ghci> mapM_ putStrLn . fromDiffList . snd . runWriter $ gcdReverse' 100 34
Finished with 2
32 mod 2 = 0
34 mod 32 = 2
100 mod 34 = 32
-}
```

## 第14章 もうちょっとだけモナド

すごいHaskellたのしく学ぼう！記載

```haskell
pop :: State Stack Int
pop = do
    (x:xs) <- get
    put xs
    return x
```

以下のコンパイルエラーが発生する

```console
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
```

恐らくこの辺りのコンパイラーの仕様が原因：https://gitlab.haskell.org/ghc/ghc/-/wikis/migration/8.6#monadfaildesugaring-by-default

本来の趣旨とは異なるが動作させるために do 記法をやめて `>>=` (bind) で書き直す

```haskell
pop :: State Stack Int
pop = get >>= \(x:xs) -> put xs >>= \_ -> return x
```
