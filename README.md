# haskell-tutorial

すごいHaskellたのしく学ぼう！ の写経

## 環境

- VSCode
- https://github.com/hmemcpy/haskell-hie-devcontainer

## ~~9章 System.Random パッケージインストール~~

(最新の haskell-hie-devcontainer では不要)

```
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
