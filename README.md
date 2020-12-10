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
