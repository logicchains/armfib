#!/usr/bin/bash

builders=("clang fib.c -O3 -o cfib"\
           "ocamlopt -o mlfib unix.cmxa fib.ml"\
           "go build -o gofib fib.go"\
           "javac fib.java"\
           "mcs fib.cs"\
           "raco exe -o rktfib fib.rkt"\
           "ghc hsfib.hs -O3 -fllvm -o hsfib"\
           "sbcl --load fib.lisp --non-interactive")

numFibs=${#builders[@]}

for((i=0; i < ${numFibs}; i++));
do
   ${builders[i]}
#  echo Shirking
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

awk '$1 == "LANGUAGE" { print $2 "  " $3 }' ./rawRes > ./tmpRes
ctime=$(awk '$1 == "C" { print $2}' ./tmpRes)
echo \{ print \$1 \"  \" \$2 \"  \" ${ctime}/\$2 \* 100\} > ./tmp.awk
awk -E tmp.awk ./tmpRes > ./finRes
sort -k 3 -n -r ./finRes > ./sortedRes

echo \<html\>\<head\>\</head\>\<body\>\<table\>
echo '{print "<tr><td>"$1"</td><td>"$2"</td><td>"$3"</td></tr>"}' > ./tmp.awk
awk -E tmp.awk ./sortedRes
echo \</table\>\</body\>\</html\>
