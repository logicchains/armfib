#!/usr/bin/bash

builders=("clang fib.c -O3 -o cfib"\
           "ocamlopt fib.ml -o mlfib"\
           "go build -o gofib fib.go"\
           "javac fib.java"\
           "mcs fib.cs"\
           "raco exe -o rktfib fib.rkt"\
           "ghc hsfib.hs -O3 -fllvm -o hsfib"\
           "sbcl --load fib.lisp --non-interactive")

numFibs=${#builders[@]}

for((i=0; i < ${numFibs}; i++));
do
#   ${builders[i]}
    echo "poo"
done

runners=(  "./cfib"\
           "./mlfib"\
           "./gofib"\
           "java fib"\
           "mono fib.exe"\
           "./rktfib"\
           "./hsfib"\
           "./lsfib")

start=""
${start} > rawRes

for((i=0; i < ${numFibs}; i++));
do
   ${runners[i]} $1 >> rawRes
done
