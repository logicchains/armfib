#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double getTime(){
  struct timespec spec;
  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &spec);	
  double s = spec.tv_sec;
  double ms = spec.tv_nsec;
  return (s*1000 + ms / 1000000);
}

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
  double startTime = getTime();
  printf("%d\n", doWork(0,atoi(argv[1])));
  double duration = getTime() - startTime;
  printf("LANGUAGE  C  %d\n", (int)duration);
  return 0;
}
