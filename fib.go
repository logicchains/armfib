package main

import(
	"fmt"
	"strconv"
	"os"
	"time"
)

func fib(x int32) int32{
	if x < 2 {
		return int32(x)
	}else{
		qianVal := 0
		zuoVal := 1
		res := 0
		var i int32;
		for i = 1; i < x; i++{
			res = qianVal+zuoVal
			qianVal = zuoVal
			zuoVal = res
		}
		return int32(res)
	}
}

func doWork(rem int32) int32{
	var acc int32 = 0
	var i int32;
	for i = 0; i < rem; i++{
	    acc += fib((acc+1)%50)
	}
	return acc
}

func main(){
	start := time.Now()
	n, _ := strconv.Atoi(os.Args[1])
	fmt.Printf("%d\n", doWork(int32(n)));
	duration := time.Now().Sub(start).Nanoseconds() / 1000000
	fmt.Printf("LANGUAGE  Go  %v\n", duration)
}
