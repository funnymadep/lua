-- while
a=10
while( a < 20 )
do
   print("a = :", a)
   a = a+1
end

-- 数值for循环
--[[

for var=exp1,exp2,exp3 do  
   <执行体>  
end  
var 从 exp1 变化到 exp2，每次变化以 exp3 为步长递增 var，并执行一次 "执行体"。exp3 是可选的，如果不指定，默认为1

]]
for i=1,5 do
   print(i)
end

function f(x)
   return x
end
for i=1,f(5) do   -- 函数在条件里只会第一次执行一次
    print(i)
end
 
for i=10,1,-1 do
    print(i)
end

-- 泛型for循环
--打印数组a的所有值  
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end

days = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}  
for i,v in ipairs(days) 
do
   print(v)
end

