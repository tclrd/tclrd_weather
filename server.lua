Config = {}
Config.DynamicWeather = true
Config.Debug = true
Config.WeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    -- 'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    -- 'HALLOWEEN',
}

GlobalState.weather = 'EXTRASUNNY'
GlobalState.time = {hour = 0, minute = 0}
-- weather
Citizen.CreateThread(function()
    while true do
        Wait(60000)
        GlobalState.weather = Config.WeatherTypes[math.random(#Config.WeatherTypes)]
    end
end)

-- time
Citizen.CreateThread(function()
    while true do
        Wait(2000)
        setTime() --incrementing minutes
    end
end)

lib.addCommand('builtin.everyone', {'weather'}, function(source,args)
    if not args.weather then return end
    GlobalState.weather = string.upper(args.weather)
end, {'weather:?string'})

lib.addCommand('builtin.everyone', {'time'}, function(source,args)
    -- if not Config.Debug then return end
    -- local hour, minute = 12, 00
    -- if args.minute then minute = args.minute end
    -- if args.hour then hour = args.hour end
    GlobalState.time = {hour = args.hour or 12, minute = args.minute or 00}
end, {'hour:?number', 'minute:?number'})

function setTime()
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
    GlobalState.time = {hour = hour, minute = minute}
end