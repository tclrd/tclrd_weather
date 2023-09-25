GlobalState.weather = 'EXTRASUNNY'
GlobalState.time = { hour = 12, minute = 0 }
GlobalState.blackout = false
Weather = {}

-- Weather
CreateThread(function()
    while true do
        Wait(Config.WeatherInterval * 60000)
        local currentWeather = GlobalState.weather
        local flow = Config.WeatherTypes[currentWeather].flow
        local nextWeather = Weather:Flow(flow)
        GlobalState.weather = nextWeather.name
    end
end)

---@param flow table
---@return table
function Weather:Flow(flow)
    local totalChances = 0
    for _, entry in pairs(flow) do
        totalChances = totalChances + entry.chances
    end

    local randomValue = math.random(1, totalChances)
    local cumulativeChances = 0

    for _, entry in pairs(flow) do
        cumulativeChances = cumulativeChances + entry.chances
        if randomValue <= cumulativeChances then
            return entry
        end
    end
    -- Default to the first entry if something goes wrong
    return flow[1]
end

function Weather:SetTime()
    local hour, minute = GlobalState.time.hour, GlobalState.time.minute
    -- incrementing minutes
    if minute == 59 then -- 23:59
        if hour == 23 then
            hour = 0
            minute = 0
        else
            minute = 0
            hour = hour + 1
        end
    else
        minute = minute + 1
    end
    GlobalState.time = { hour = hour, minute = minute }
end

-- Time
CreateThread(function()
    while true do
        Wait(Config.Timescale * 1000)
        Weather:SetTime() --incrementing minutes
    end
end)

-- Exports
---@param source number
---@param type string
---@param value boolean
---@return boolean
local function setSync(source, type, value)
    if source == nil or value == nil or type == nil then return false end
    TriggerClientEvent('weather:setSync', source, type, value)
    return true
end

exports('setSync', setSync)

lib.addCommand('weather', {
    help = 'Set the weather',
    params = {
        {
            name = 'weather',
            help = 'The weather to set',
            type = 'string'
        }
    },
    restricted = 'group.admin',
}, function(source, args, rawCommand)
    if not args.weather then return end
    GlobalState.weather = string.upper(args.weather)
    lib.logger('Weather set to ' .. tostring(GlobalState.weather) .. ' by ' .. GetPlayerName(source))
end)

lib.addCommand('time', {
    help = 'Set the time',
    params = {
        {
            name = 'hour',
            help = 'The hour to set 00 - 23',
            type = 'number'
        },
        {
            name = 'minute',
            help = 'The minute to set 00 - 59',
            type = 'number'
        }
    },
    restricted = 'group.admin',
}, function(source, args, rawCommand)
    if not args.hour or not args.minute then return end
    GlobalState.time = { hour = args.hour, minute = args.minute }
    lib.logger('Time set to ' .. tostring(GlobalState.time) .. ' by ' .. GetPlayerName(source))
end)

lib.addCommand('blackout', {
    help = 'Toggle blackout',
    restricted = 'group.admin',
}, function(source, args, rawCommand)
    GlobalState.blackout = not GlobalState.blackout
    lib.logger('Blackout toggled to ' .. tostring(GlobalState.blackout) .. ' by ' .. GetPlayerName(source))
end)
