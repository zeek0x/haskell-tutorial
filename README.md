# haskell-tutorial

すごいHaskellたのしく学ぼう！ の写経

## 環境

- VSCode
- https://github.com/hmemcpy/haskell-hie-devcontainer

## 9章 System.Random パッケージインストール
```
$ nix-env -iA nixpkgs.binutils-unwrapped
$ cabal update
$ cabal install --lib random
```
