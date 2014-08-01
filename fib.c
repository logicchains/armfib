#include <stdio.h>
#include <stdlib.h>

int fibRec(qianVal,zuoVal,rem){
  if(rem == 0){
    return zuoVal;
  }else{
    return fibRec(zuoVal,qianVal+zuoVal,rem-1);
  }
}

int fib(x){
  if(x < 2){
    return x;
  }else{
    return fibRec(0,1,x-1);
  }
}

int doWork(acc,rem){
  if (rem == 0) return acc;
  return doWork(acc + fib((acc+1) % 50), rem-1);
}
    
int main(int argc, char** argv){
  printf("%d\n", doWork(0,atoi(argv[1])));
  return 0;
}
