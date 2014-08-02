{-# LANGUAGE BangPatterns #-}

import Data.Time.Clock.POSIX
import System.Environment
import Text.Printf
               
fibRec :: Int -> Int -> Int -> Int
fibRec !qianVal !zuoVal !rem = case rem of
   0 -> zuoVal
   n -> fibRec zuoVal (qianVal+zuoVal) (rem-1)

fib :: Int -> Int
fib !x = case x of
    0 -> 0
    1 -> 1
    n -> fibRec 0 1 (n-1)

doWork :: Int -> Int -> Int
doWork !acc !rem = case rem of
    0 -> acc
    n -> doWork (acc + fib (mod (acc+1) 50)) (rem-1)

main = do
  !start <- getPOSIXTime
  (n:_) <- getArgs
  print $ doWork 0 $ read n
  end <- getPOSIXTime
  printf "LANGUAGE  Haskell  %d\n" (round $ 1000 * (end - start)::Int)
