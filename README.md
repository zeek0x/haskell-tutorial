# haskell-tutorial

## 環境構築
```
$ docker pull haskell
$ docker run -id -w /work -v $(pwd):/work --name haskell-tutorial haskell
$ docker exec -it haskell-tutorial /bin/bash
```
