#!/usr/bin/bash -u

if [ $# -ne 2 ]; then echo -e "Usage is sh $0 <NumIterations> <Compile?>"; exit 1; fi

if [ "$2" = true ]; then
echo "Compiling..."
builders=("clang fib.c -O3 -o cfib"\
           "ocamlopt -o mlfib unix.cmxa fib.ml"\
           "go build -o gofib fib.go"\
           "javac fib.java"\
           "mcs fib.cs"\
           "raco exe -o rktfib fib.rkt"\
           "ghc hsfib.hs -O3 -fllvm -o hsfib"\
           "sbcl --load fib.lisp --non-interactive"\
           "rustc fib.rs --opt-level=3 -o rsfib")

for((i=0; i < ${#builders[@]}; i++));
do
   ${builders[i]}
#  echo Shirking
done

fi

echo "Running..."

runners=(  "./cfib"\
           "./mlfib"\
           "./gofib"\
           "java fib"\
           "mono fib.exe"\
           "./rktfib"\
           "./hsfib"\
           "./lsfib"\
           "luajit ./fib.lua"\
           "./rsfib")

start=""
${start} > rawRes

for((i=0; i < ${#runners[@]}; i++));
do
   ${runners[i]} $1 >> rawRes
done

echo "Organising results..."

awk '$1 == "LANGUAGE" { print $2 "  " $3 }' ./rawRes > ./tmpRes
ctime=$(awk '$1 == "C" { print $2}' ./tmpRes)
echo \{ print \$1 \"  \" \$2 \"  \" ${ctime}/\$2 \* 100\} > ./tmp.awk
awk -E tmp.awk ./tmpRes > ./finRes
sort -k 3 -n -r ./finRes > ./sortedRes

echo '<html><head></head><body><table style="width: 100%" border="1" cellspacing="1" cellpadding="1">'
echo '<th style="width: 40%">Language</th><th style="width: 20%">Runtime (ms)</th>'
echo '<th style="width: 20%"> % C speed </th>'
echo '{print "<tr><td>"$1"</td><td>"$2"</td><td>"$3"</td></tr>"}' > ./tmp.awk
awk -E tmp.awk ./sortedRes
echo '</table></body></html>'

echo "Results are in ./sortedRes"
