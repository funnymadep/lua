local socket = require("socket")
local read_json = require("read_json")

-- 加载json 获取卡片数据
local function get_json_text()
    local cards_data, err = read_json.get_text()
    if not cards_data then
        print("错误: " .. err)
        return
    else
        read_json.print_json(cards_data)
        print("数据加载成功!")
    end
    return cards_data
end

local function data_parsing(data)
    
end

local function main()
    print(socket._VERSION)
    -- 配置服务器参数
    local host = "0.0.0.0"  -- 监听所有网络接口
    local port = 12345       -- 监听端口
    
    -- 创建服务器 socket
    local server = assert(socket.bind(host, port))
    server:settimeout(0)  -- 设置非阻塞模式
    print("Server started at " .. host .. ":" .. port)
    
    local clients = {}  -- 存储所有客户端连接
    
    local json_date = get_json_text

    -- 主循环
    while true do
        -- 接受新连接
        local new_client = server:accept()
        if new_client then
            new_client:settimeout(0)
            table.insert(clients, new_client)
            print("New client connected: " .. tostring(new_client:getpeername()))
        end
    
        -- 检查所有客户端的数据
        local disconnected = {}
        for i, client in ipairs(clients) do
            local data, err = client:receive("*l")  -- 按行读取数据
            
            if data then
                -- 收到数据，转发给所有客户端
                print("Received: " .. data)
                for j, other in ipairs(clients) do
                    if other ~= client then  -- 先发送给其他客户端
                        other:send(data .. "\n")
                    end
                end
                client:send(data .. "\n")  -- 最后发送给发送者自己
            elseif err == "closed" then
                -- 客户端断开连接
                print("Client disconnected: " .. tostring(client:getpeername()))
                table.insert(disconnected, i)
            end
        end
    
        -- 清理断开的客户端
        for i = #disconnected, 1, -1 do
            clients[disconnected[i]]:close()
            table.remove(clients, disconnected[i])
        end
    
        socket.sleep(0.01)  -- 避免 CPU 占用过高
    end
end

local success = pcall(main)
if not success then
    print("发生错误 主函数运行失败")
end