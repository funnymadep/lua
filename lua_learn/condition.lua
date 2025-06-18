-- if...
--[[

if(布尔表达式)
then
   --[ 在布尔表达式为 true 时执行的语句 --]
end

]]

-- lua中0为true false和nil为假，true和非nil为真
--[ 0 为 true ]
if(0)
then
    print("0 is true")
end

a = 10
if(a < 20)
then
    print("a < 20")
end

-- if...else
--[[

if(布尔表达式)
then
   --[ 布尔表达式为 true 时执行该语句块 --]
else
   --[ 布尔表达式为 false 时执行该语句块 --]
end

]]

a = 100;
if( a < 20 )
then
   --[ if 条件为 true 时执行该语句块 --]
   print("a < 20" )
else
   --[ if 条件为 false 时执行该语句块 --]
   print("a > 20" )
end
print("a = ", a)

-- if ... elseif ... else
--[[
if( 布尔表达式 1)
then
   --[ 在布尔表达式 1 为 true 时执行该语句块 --]

elseif( 布尔表达式 2)
then
   --[ 在布尔表达式 2 为 true 时执行该语句块 --]

elseif( 布尔表达式 3)
then
   --[ 在布尔表达式 3 为 true 时执行该语句块 --]
else 
   --[ 如果以上布尔表达式都不为 true 则执行该语句块 --]
end
]]
--[ 定义变量 --]
a = 100

--[ 检查布尔条件 --]
if( a == 10 )
then
   --[ 如果条件为 true 打印以下信息 --]
   print("a = 10" )
elseif( a == 20 )
then   
   --[ if else if 条件为 true 时打印以下信息 --]
   print("a = 20" )
elseif( a == 30 )
then
   --[ if else if condition 条件为 true 时打印以下信息 --]
   print("a = 30" )
else
   --[ 以上条件语句没有一个为 true 时打印以下信息 --]
   print("no a" )
end
print("a is ", a )
