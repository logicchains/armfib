package main

import(
	"fmt"
	"strconv"
	"os"
)

func fib(x int) int{
	if x < 2 {
		return x
	}else{
		qianVal := 0
		zuoVal := 1
		res := 0
		for i := 1; i < x; i++{
			res = qianVal+zuoVal
			qianVal = zuoVal
			zuoVal = res
		}
		return res
	}
}

func doWork(rem int) int{
	acc := 0
	for i := 0; i < rem; i++{
	    acc += fib((acc+1)%50)
	}
	return acc
}

func main(){
	n, _ := strconv.Atoi(os.Args[1])
	fmt.Printf("%d\n", doWork(n));
}
