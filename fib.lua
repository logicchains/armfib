local function fibRec(qianVal, zuoVal, rem)
      if rem < 1 
      	 then return zuoVal
     	 else return fibRec(zuoVal,qianVal+zuoVal,rem-1)
      end
end

local function fib(x)
      if x < 2 
      	 then return x
	 else return fibRec(0,1,x-1)
      end
end

local function doWork(acc,rem)
      if rem < 1
      	 then return acc
	 else return doWork(acc + fib((acc+1)%50), rem-1)
      end
end

local function start()
      local n = tonumber(arg[1])
      start = os.clock()
      io.stdout:write(doWork(0,n) .. "\n")
      duration = os.clock() - start
      io.stdout:write("LANGUAGE  LuaJit  " .. math.floor(duration*1000) .. "\n")
end

start()