local weatherSync, timeSync = true, true
local currentWeather = nil
local blackout = false
local hour, minute, second = 12, 0, 0
local debug = false or GetConvarInt('tclrd_weather:debug', 0) == 1
local Weather = {}

NetworkOverrideClockMillisecondsPerGameMinute(1000)

function Weather:SyncNow()
    if not weatherSync then return end
    SetWeatherTypeNow(GlobalState.weather)
end

function Weather:Sync()
    self:SyncNow()
    CreateThread(function()
        while true do
            Wait(1000)
            if not weatherSync then
                Wait(1000)
                return
            end
            if currentWeather == nil then return end
            if debug then
                print('weatherSyncing', currentWeather)
            end
            SetWeatherTypeNow(currentWeather)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist(currentWeather)
            SetWeatherTypeNow(currentWeather)
            SetWeatherTypeNowPersist(currentWeather)

            if currentWeather == "XMAS" then
                SetForceVehicleTrails(true)
                SetForcePedFootstepsTracks(true)
            else
                SetForceVehicleTrails(false)
                SetForcePedFootstepsTracks(false)
            end
        end
    end)
end

AddStateBagChangeHandler('weather', 'global', function(bagName, key, value, reserved, replicated)
    -- print(bagName, key, value, reserved, replicated)
    if not weatherSync then return end
    currentWeather = value
    print('weather changed to', currentWeather)
    SetWeatherTypeOvertimePersist(currentWeather, 30.0)
end)

AddStateBagChangeHandler('time', 'global', function(bagName, key, value, reserved, replicated)
    -- print(bagName, key, value.hour, value.minute, reserved, replicated)
    if not timeSync then return end
    hour = value.hour
    minute = value.minute
    second = 0
    CreateThread(function()
        while second < 59 do
            Wait(2000 / 60) -- 1000 / 60
            second = second + 1
            NetworkOverrideClockTime(hour, minute, second)
            if second > 59 then
                break
            end
        end
    end)
end)

-- needs to be made into event netevent to be triggered by server for security
---@param value boolean
RegisterNetEvent('weather:setSyncing', function(value)
    if value == nil then return end
    weatherSync = value
    if not weatherSync then
        SetWeatherTypeNow('CLEAR')
    else
        SetWeatherTypeNow(GlobalState.weather)
    end
end)

AddEventHandler('ox:playerLoaded', function(data)
    if debug then
        print('player loaded')
    end
    Weather:Sync()
    NetworkOverrideClockTime(GlobalState.time.hour, GlobalState.time.minute, 00)
end)
