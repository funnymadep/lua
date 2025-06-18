-- Lua 变量有三种类型：全局变量、局部变量、表中的域
function test()
    local a = 1  -->函数局部
    b = 2        -->全局变量
end

test()
print(a)         -->nil
print(b)         -->2

do 
    local b = 3
    a = 4
end
print(a)          -->4
print(b)          -->2

-- Lua 可以对多个变量同时赋值，变量列表和值列表的各个元素用逗号分开，赋值语句右边的值会依次赋给左边的变量
a, b = 10 , 10*2
print(a)          -->10
print(b)          -->20

-- 遇到赋值语句Lua会先计算右边所有的值然后再执行赋值操作，所以我们可以这样进行交换变量的值：
x, y = 1, 2
print('x=' .. x .. ' y=' .. y)
x, y = y, x                     -- swap 'x' for 'y'
print('x=' .. x .. ' y=' .. y)
-- a[i], a[j] = a[j], a[i]         -- swap 'a[i]' for 'a[j]'

-- Lua会一直以变量个数为基础采取策略
a, b, c = 0, 1
print(a,b,c)             --> 0   1   nil
a, b = a+1, b+1, b+2     -- value of b+2 is ignored
print(a,b)               --> 1   2
a, b, c = 0
print(a,b,c)             --> 0   nil   nil

function f()             
    local num1 = 1;
    local num2 = 2;
    return num1, num2
end
c, d = f()
print(c,d)              --> c=1 d=2
