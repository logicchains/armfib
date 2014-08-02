extern crate time;

use std::os; 
use time::precise_time_ns;

fn fib_rec(qianVal:int,zuoVal:int,rem:int)->int{
  if rem == 0{
    zuoVal 
  }else{
    fib_rec(zuoVal,qianVal+zuoVal,rem-1)
  }  
}

fn fib(x:int)->int{
  if x < 2{
    x
  }else{
    fib_rec(0,1,x-1)
  } 
}

fn do_work(acc:int,rem:int)->int{
  if rem == 0 {
    acc
  }else{
    do_work(acc + fib((acc+1) % 50), rem-1)
  }
}

fn main() {
  let n : int = from_str(os::args().get(1).as_slice()).expect("First argument must be an int");
  let startTime = precise_time_ns();
  println!("{}",do_work(0,n));
  let duration = (precise_time_ns() - startTime) / 1000000;
  println!("LANGUAGE  Rust  {}", duration);
}
