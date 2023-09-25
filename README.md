# tclrd-weathersync

## Weather Syncing for FiveM

:sunny: Time & Weather synchronization for any framework. :watch:

## Dependencies

- [ox-lib](https://github.com/overextended/ox_lib)

## Features

- Weather synced across all clients using Global State
- Time synced across all clients using Global State
- Exports to disable syncing (for inside shells)
- 0.01ms CPU time

## Installation
- Download the source files and place in your `resources` directory.
- Add the script to your server.cfg
```
start tclrd-weather
```

## Configuration
- TODO

## Commands
`/time [hour] (minute)` - Defaults to 12 00 if no hour / minute specified
`/weather [type]` - Set weather
`/blackout [true/false]` - Set blackout


## Exports

### toggleSync [status]
```lua
-- LUA EXAMPLE
---@param status boolean
exports['tclrd-weather']:setSync(status)
```

## License
```

```