{-# LANGUAGE BangPatterns #-}

import System.Environment

fibRec :: (Int, Int, Int) -> Int
fibRec (!qianVal, !zuoVal, !rem) = case rem of
   0 -> zuoVal
   n -> fibRec (zuoVal, qianVal+zuoVal, rem-1)

fib :: Int -> Int
fib !x = case x of
    0 -> 0
    1 -> 1
    n -> fibRec (0, 1, n-1)

doWork :: (Int, Int) -> Int
doWork (!acc, !rem) = case rem of
    0 -> acc
    n -> doWork (acc + fib (mod (acc+1) 50), rem-1);;

main = do
     (n:_) <- getArgs
     print $ doWork (0, read n)
