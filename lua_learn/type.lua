print(type("Hello world"))      --> string      字符串由一对双引号或单引号来表示
print(type(10.4*3))             --> number      表示双精度类型的实浮点数
print(type(print))              --> function    由 C 或 Lua 编写的函数
print(type(type))               --> function    
print(type(true))               --> boolean     包含两个值：false和true。
print(type(nil))                --> nil
print(type(type(X)))            --> string

-- nil表示空 也可以删除table的值
print("\n")
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
 
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

-- nil 作比较时应该加上双引号 type(X) 实质是返回的 "nil" 字符串，是一个 string 类型
print("\n")
print(type(X)==nil)         -->false
print(type(X)=="nil")       -->true  

-- boolean 类型只有两个可选值：true（真） 和 false（假），Lua 把 false 和 nil 看作是 false，其他的都为 true，数字 0 也是 true
print("\n ")
print(type(true))           -->boolean
print(type(false))          -->boolean
print(type(nil))            -->nil
 
if false or nil then
    print("both true")
else
    print("false and nil are false")
end

if 0 then
    print("0 is true")
else
    print("0 is false")
end

-- Lua 默认只有一种 number 类型 -- double（双精度）类型 以下几种写法都被看作是 number 类型 结果均为number
print("\n")
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))

-- 字符串由一对双引号或单引号来表示。 也可以用 2 个方括号 "[[]]" 来表示"一块"字符串。
print("\n")
str1 = "this is a str"
str2 = 'this is a str'
html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html> 
]]
print(str1)
print(str2)
print(html)

-- 在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字
print(2 + 2)
print('2' + 2)
print('0.2' + 5)
print('0.22' * 5)

-- 字符串连接使用的是 ..
print("\n")
print(152 .. 121)
print("132" .. "heal")

-- 使用 # 来计算字符串的长度
print("\n")
str3 = "123456"
print(#str3)
print(#"123456")

-- Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字或者是字符串
print("\n")
local tab2 = {} -- 创建空表 
local tab3 = {'apple', 'pear', 'orange', 'banana'}
tab2['key'] = 'value'
tab2[10] = 100
tab2[10] = tab2[10] + 1
for k , v in pairs(tab2) do
    print(k .. ':' .. v)
end

-- Lua table的索引不同以往 是从1开始
print("\n")
local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
end

-- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil。
local a3 = {}
for i = 1, 10 do
    a3[i] = i
end
a3["key"] = "val"
print("\n")
print(a3["key"])
print(a3["none"])

--  Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里
print("\n")
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))

-- function 可以以匿名函数（anonymous function）的方式通过参数传递
-- function_test2.lua 脚本文件
print("\n")
function testFun(tab,fun)
        for k ,v in pairs(tab) do
                print(fun(k,v));
        end
end


tab={key1="val1",key2="val2"};
testFun(tab,
function(key,val)--匿名函数
        return key.."="..val;
end
);