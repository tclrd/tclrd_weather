# tclrd-weather

## Weather System for OneSync Infinity

:sunny: Time & Weather synchronization for any framework. :watch:

## Dependencies

- [ox-lib](https://github.com/overextended/ox_lib)

## Features

- Weather synced across all clients using Global State
- Time synced across all clients using Global State
- Blackout synced across all clients using Global State
- Exports to disable syncing (for inside shells)
- 0.00ms idle

![resmon idle](https://i.imgur.com/WmP440g.png)

## Installation
Download the latest [release](https://github.com/tclrd/tclrd_weather/releases) and place in your `resources` directory.
Add the script to your server.cfg
```
start tclrd-weather
```

## Configuration
View `config.lua` to change the default settings.

`Config.TimeScale = 1` - Ratio of in-game minutes to real-world seconds (default: 2)

## Commands
`/time [hour] [minute]` - Defaults to 12 00 if no hour / minute specified

`/weather [type]` - See [Native Reference - SetWeatherTypeNow](https://docs.fivem.net/docs/game-references/weather-types/) for available types

`/blackout [true/false]` - Set blackout


## Exports

### setSync [status]
```lua
---@param status boolean
exports['tclrd-weather']:setSync(status)
```

## License
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)