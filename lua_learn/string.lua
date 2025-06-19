-- string 写法
do
    local multilineString = [[
    This is a multiline string.
    It can contain multiple lines of text.
    No need for escape characters.
    ]]
    -- 以下三种字符串写法
    print(multilineString)
    local string1 = "Lua"
    print("\"string 1 is\"",string1)
    local string2 = 'runoob.com'
    print("string 2 is",string2)
    local string3 = [["Lua"]]
    print("string 3 is",string3)
end

-- 字符串截取
do
    print(string.byte("\n"))
    local sourcestr = "prefix--runoobgoogletaobao--suffix"
    print("\noriginal string", string.format("%q", sourcestr))
    -- 截取部分，第4个到第15个
    local first_sub = string.sub(sourcestr, 4, 15)
    print("\nfirst cut", string.format("%q", first_sub))
    -- 取字符串前缀，第1个到第8个
    local second_sub = string.sub(sourcestr, 1, 8)
    print("\nsecond cut", string.format("%q", second_sub))
    -- 截取最后10个
    local third_sub = string.sub(sourcestr, -10)
    print("\nthird cut", string.format("%q", third_sub))
    -- 索引越界，输出原始字符串
    local fourth_sub = string.sub(sourcestr, -100)
    print("\nfour cut", string.format("%q", fourth_sub))
end

-- string.len 函数用于计算只包含 ASCII 字符串的长度
do
    print(string.byte("\n"))
    local myString = "Hello, RUNOOB!"
    -- 计算字符串的长度（字符个数）
    local length = string.len(myString)
    print(length) -- 输出 14
    myString = "Hello, 世界!"
    -- 计算含有中文的需要使用utf8
    local length1 = utf8.len(myString)
    print(length1) -- 输出 10
    -- string.len 函数会导致结果不准确
    local length2 = string.len(myString)
    print(length2) -- 输出 14
end

-- 字符串大小写转换
do
    print(string.byte("\n"))
    local string1 = "Lua";
    print(string.upper(string1))
    print(string.lower(string1))
end

-- 字符串查找与反转
do
    print(string.byte("\n"))
    local string = "Lua Tutorial"
    -- 查找字符串
    print(string.find(string,"Tutorial"))           --> find返回开始索引与结束索引
    local reversedString = string.reverse(string)
    print("new string is",reversedString)
end

-- format字符串格式化
do
    print(string.byte("\n"))
    print(string.format("%c", 83))               -- 输出S
    print(string.format("%+d", 17.0))              -- 输出+17
    print(string.format("%05d", 17))               -- 输出00017
    print(string.format("%o", 17))                 -- 输出21
    -- print(string.format("%u", 3))               -- 输出3
    print(string.format("%x", 13))                 -- 输出d
    print(string.format("%X", 13))                 -- 输出D
    print(string.format("%e", 1000))               -- 输出1.000000e+03
    print(string.format("%E", 1000))               -- 输出1.000000E+03
    print(string.format("%6.3f", 13))              -- 输出13.000
    print(string.format("%q", "One\nTwo"))         -- 输出"One\
                                            -- 　　Two"
    print(string.format("%s", "monkey"))           -- 输出monkey
    print(string.format("%10s", "monkey"))         -- 输出    monkey
    print(string.format("%5.3s", "monkey"))        -- 输出  mon
end

-- 字符相互转换
do
    print(string.byte("\n"))
    -- 转换第一个字符
    print(string.byte("Lua"))
    -- 转换第三个字符
    print(string.byte("Lua",3))
    -- 转换末尾第一个字符
    print(string.byte("Lua",-1))
    -- 第二个字符
    print(string.byte("Lua",2))
    -- 转换末尾第二个字符
    print(string.byte("Lua",-2))

    -- 整数 ASCII 码转换为字符
    print(string.char(97))
end