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
