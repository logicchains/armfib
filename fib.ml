open Printf
open Unix

let rec fibRec qianVal zuoVal rem = match rem with
    0 -> zuoVal
  | n -> fibRec zuoVal (qianVal+zuoVal) (rem-1)
  
let fib x = match x with
    0 -> 0
  | 1 -> 1
  | n -> fibRec 0 1 (n-1)

let n = int_of_string Sys.argv.(1);;

let rec doWork acc rem = match rem with
    0 -> acc
  | n -> doWork (acc + fib ((acc+1) mod 50)) (rem-1);;

let start = Unix.gettimeofday();;
  printf "%d\n" (doWork 0 n);;
    printf "LANGUAGE  Ocaml  %d\n" @@ int_of_float @@ 1000. *. (Unix.gettimeofday() -. start);;
