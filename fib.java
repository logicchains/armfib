//I'm changing something, wooooo!
public class fib{
    private static int fib(int x){
	if(x < 2){
	    return x;
	}else{
	    int qianVal = 0;
	    int zuoVal = 1;
	    int res = 0;
	    for(int i = 1; i < x; i++){
		res = qianVal+zuoVal;
	        qianVal = zuoVal;
		zuoVal = res;
	    }
	    return res;
	}
    }
    private static int doWork(int rem){
	int acc = 0;
	for(int i = 0; i < rem; i++){
	    acc += fib((acc+1)%50);
	}
	return acc;
    }
    public static void main(String[] args){
	long start = System.currentTimeMillis();
	System.out.printf("%d\n", doWork(Integer.parseInt(args[0])));
	long duration = System.currentTimeMillis() - start;
	System.out.println("LANGUAGE  Java  "+ duration);
    }
}
