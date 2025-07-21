local socket = require("socket")

-- 配置参数
local HOST = "0.0.0.0"  -- 监听所有接口
local PORT = 5151
local BUFFER_SIZE = 4096  -- 4KB数据块

print("启动服务器...")
local server = assert(socket.bind(HOST, PORT))
server:settimeout(nil)  -- 阻塞模式

while true do
    print("等待客户端连接...")
    local client = server:accept()
    client:settimeout(10)  -- 设置超时时间(秒)
    
    -- 接收文件名
    local filename = assert(client:receive("*l"))
    print("接收文件: " .. filename)
    assert(client:send("READY\n"))
    
    -- 接收文件大小
    local filesize = tonumber(assert(client:receive("*l")))
    print("文件大小: " .. filesize .. " bytes")
    assert(client:send("OK\n"))
    
    -- 创建文件
    local file = io.open(filename, "wb")
    if not file then
        error("无法创建文件: " .. filename)
    end
    
    -- 接收文件数据
    local received = 0
    while received < filesize do
        local chunk = client:receive(BUFFER_SIZE)
        if not chunk then break end
        file:write(chunk)
        received = received + #chunk
        -- 显示进度
        local percent = math.floor((received / filesize) * 100)
        io.write("\r已接收: " .. percent .. "% (" .. received .. "/" .. filesize .. ")")
        io.flush()
    end
    
    file:close()
    print("\n传输完成! 文件保存为: " .. filename)
    client:close()
    print("等待下次传输...\n")
end