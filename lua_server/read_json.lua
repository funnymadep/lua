local json = require("dkjson")  -- 需要安装 dkjson 库: luarocks install dkjson

local read_json = {}

-- 辅助函数：计算表的元素数量
local function table_size(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

-- 从文件读取 JSON 数据
local function read_json_file(filename)
    local file = io.open(filename, "r")
    if not file then
        return nil, "无法打开文件: " .. filename
    end
    
    local content = file:read("*a")  -- 读取整个文件内容
    file:close()
    return content
end

-- 主函数
function read_json.get_text()
    os.execute("chcp 65001") -- 设置控制台编码为 UTF-8
    -- 提示用户输入文件名
    local filename = "cards.json"
    
    -- 读取 JSON 文件内容
    local json_content, err = read_json_file(filename)
    if not json_content then
        print(err)
        print("请确保文件位于当前目录: " .. io.popen("cd"):read("*l"))
        return
    end
    
    print("已读取文件: " .. filename)
    
    -- 解析 JSON 数据
    local data, pos, json_err = json.decode(json_content, 1, nil)
    if json_err then
        error("JSON 解析错误: " .. json_err)
    end
    print("JSON 解析成功!")
    
    -- 分类存储到不同的表中
    local cause_of_death = data["死因牌"]            -- 死因牌
    local characteristic_cards = data["特征牌"]       -- 特征牌
    local location_cards = data["地点牌"]            -- 地点牌
    local event_cards = data["事件牌"]              -- 事件牌
    local means_cards = data["手段牌"]              -- 手段牌
    local clue_cards = data["线索牌"]               -- 线索牌
    
    -- 打印统计信息
    print("\n===== 数据统计 =====")
    print("死因牌数量: " .. #cause_of_death)
    
    local characteristic_count = 0
    for category, cards in pairs(characteristic_cards) do
        characteristic_count = characteristic_count + #cards
    end
    print("特征牌分类数: " .. table_size(characteristic_cards) .. " 类")
    print("特征牌总数: " .. characteristic_count)
    
    print("地点牌组数: " .. #location_cards)
    print("事件牌数量: " .. #event_cards)
    print("手段牌数量: " .. #means_cards)
    print("线索牌数量: " .. #clue_cards)
    
    -- 返回所有分类表
    return {
        cause_of_death = cause_of_death,
        characteristic_cards = characteristic_cards,
        location_cards = location_cards,
        event_cards = event_cards,
        means_cards = means_cards,
        clue_cards = clue_cards
    }
end

function read_json.print_json(result)
        -- 示例：如何使用这些数据
    print("\n===== 示例用法 =====")
    local cards_data = result
    
    -- 随机获取一个死因
    if #cards_data.cause_of_death > 0 then
        math.randomseed(os.time())  -- 初始化随机种子
        local random_cause = cards_data.cause_of_death[math.random(#cards_data.cause_of_death)]
        print("随机死因: " .. random_cause)
    end
    
    -- 获取所有特征分类
    if next(cards_data.characteristic_cards) then
        local first_category = next(cards_data.characteristic_cards)
        print("第一个特征分类: " .. first_category)
        
        -- 获取特定特征分类的选项
        local time_options = cards_data.characteristic_cards["时间"]
        if time_options then
            print("时间选项: " .. table.concat(time_options, ", "))
        end
    end
    
    -- 随机获取一个地点
    if #cards_data.location_cards > 0 then
        local location_group = cards_data.location_cards[math.random(#cards_data.location_cards)]
        if #location_group > 0 then
            local random_location = location_group[math.random(#location_group)]
            print("随机地点: " .. random_location)
        end
    end
    
    -- 查看事件牌描述
    if #cards_data.event_cards > 0 then
        print("第一个事件牌描述: \n" .. cards_data.event_cards[1])
    end
    
    -- 随机获取一个手段
    if #cards_data.means_cards > 0 then
        local random_means = cards_data.means_cards[math.random(#cards_data.means_cards)]
        print("随机手段: " .. random_means)
    end
    
    -- 随机获取一个线索
    if #cards_data.clue_cards > 0 then
        local random_clue = cards_data.clue_cards[math.random(#cards_data.clue_cards)]
        print("随机线索: " .. random_clue)
    end
end

return read_json