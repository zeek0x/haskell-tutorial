{-
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S
ghci> B.pack [99,97,110]
"can"
ghci> B.pack [98..120]
"bcdefghijklmnopqrstuvwx"
ghci> let by = B.pack [98,111,114,116]
ghci> by
"bort"
ghci> B.unpack by
[98,111,114,116]
ghci> B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]
"()*+,-./0
ghci> B.cons 85 $ B.pack [80,81,82,84]
"UPQRT"
bash-5.0$ ./bytestringcopy bart.txt bort.txt
-}
