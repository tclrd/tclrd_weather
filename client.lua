local weatherSync = true
local currentWeather = GlobalState.weather
local previousWeather = currentWeather
local blackout = false
local hour, minute, second = 0, 0, 0

NetworkOverrideClockMillisecondsPerGameMinute(1000)

AddEventHandler('ox:playerLoaded', function(data)
    print('player loaded - tclrd-weather')
    SetWeatherTypeNow(GlobalState.weather)
    NetworkOverrideClockTime(GlobalState.time.hour, GlobalState.time.minute, 00)
end)

AddStateBagChangeHandler('weather','global', function(bagName, key, value, reserved, replicated)
    -- print(bagName, key, value, reserved, replicated)
    if weatherSync then
        previousWeather = currentWeather
        currentWeather = value
        print('previousWeather:',previousWeather)
        print('currentWeather:',currentWeather)
        SetWeatherTypeOvertimePersist(currentWeather, 15.0)
    end
end)

AddStateBagChangeHandler('time','global', function(bagName, key, value, reserved, replicated)
    -- print(bagName, key, value.hour, value.minute, reserved, replicated)
    hour = value.hour
    minute = value.minute
    second = 0
    Citizen.CreateThread(function()
        while second < 59 do
            Wait(2000/60) -- 1000 / 60
                second = second + 1
            
            -- print(hour, minute, second)
            NetworkOverrideClockTime(hour, minute, second)
            if second > 59 then
                break
                print('WE FUCKED UP, second =', second)
            end
        end
    end)
end)

---@param status boolean
function toggleSync(status)
    weatherSync = status
    if not weatherSync then
        SetWeatherTypeNow('CLEAR')
    else
        SetWeatherTypeNow(GlobalState.weather)
    end
end