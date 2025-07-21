local socket = require("socket")

-- 配置参数
local HOST = "192.168.1.100"  -- 服务器IP
local PORT = 5151
local BUFFER_SIZE = 4096  -- 4KB数据块

-- 获取文件路径
local filename = arg[1]
if not filename then
    print("请指定文件路径: lua client.lua <文件路径>")
    os.exit(1)
end

-- 检查文件
local file = io.open(filename, "rb")
if not file then
    error("无法打开文件: " .. filename)
end
local filesize = file:seek("end")
file:seek("set")  -- 重置文件指针

print("连接服务器 " .. HOST .. ":" .. PORT)
local client = assert(socket.connect(HOST, PORT))
client:settimeout(10)

-- 发送文件名
print("发送文件名: " .. filename)
assert(client:send(filename .. "\n"))
assert(client:receive("*l") == "READY")

-- 发送文件大小
print("文件大小: " .. filesize .. " bytes")
assert(client:send(filesize .. "\n"))
assert(client:receive("*l") == "OK")

-- 发送文件数据
local sent = 0
while sent < filesize do
    local chunk = file:read(BUFFER_SIZE)
    if not chunk then break end
    client:send(chunk)
    sent = sent + #chunk
    -- 显示进度
    local percent = math.floor((sent / filesize) * 100)
    io.write("\r已发送: " .. percent .. "% (" .. sent .. "/" .. filesize .. ")")
    io.flush()
end

file:close()
client:close()
print("\n\n文件传输完成!")