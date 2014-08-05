extern crate time;

use std::os;
use time::precise_time_ns;

fn fib_rec(qianVal:i32,zuoVal:i32,rem:i32)->i32{
  if rem == 0{
    zuoVal
  }else{
    fib_rec(zuoVal,qianVal+zuoVal,rem-1)
  }
}

fn fib(x:i32)->i32{
  if x < 2{
    x
  }else{
    fib_rec(0,1,x-1)
  }
}

fn do_work(acc:i32,rem:i32)->i32{
  if rem == 0 {
    acc
  }else{
    do_work(acc + fib((acc+1) % 50), rem-1)
  }
}

fn main() {
  let n : i32 = from_str(os::args().get(1).as_slice()).expect("First argument must be an i32");
  let startTime = precise_time_ns();
  println!("{}",do_work(0,n));
  let duration = (precise_time_ns() - startTime) / 1000000;
  println!("LANGUAGE Rust {}", duration);
}
