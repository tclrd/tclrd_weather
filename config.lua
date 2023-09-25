Config = {}
Config.DynamicWeather = true
Config.Timescale = 2 -- number of ingame minutes to real life seconds
Config.WeatherInterval = 10 -- number of real life minutes to change weather

Config.WeatherTypes = {
    EXTRASUNNY = {
        name = "EXTRASUNNY",
        flow = {
            { name = "CLEAR",      chances = 20 },
            { name = "FOGGY",      chances = 20 },
            { name = "OVERCAST",   chances = 20 },
            { name = "CLOUDS",     chances = 20 },
            { name = "EXTRASUNNY", chances = 20 }
        },
        enable = true
    },

    CLEAR = {
        name = "CLEAR",
        flow = {
            { name = "EXTRASUNNY", chances = 20 },
            { name = "FOGGY",      chances = 20 },
            { name = "OVERCAST",   chances = 20 },
            { name = "CLOUDS",     chances = 20 }
        },
        enabled = true
    },

    FOGGY = {
        name = "FOGGY",
        flow = {
            { name = "CLEAR",      chances = 20 },
            { name = "FOGGY",      chances = 20 },
            { name = "OVERCAST",   chances = 20 },
            { name = "CLOUDS",     chances = 20 },
            { name = "EXTRASUNNY", chances = 20 }
        },
        enabled = true
    },

    OVERCAST = {
        name = "OVERCAST",
        flow = {
            { name = "FOGGY",    chances = 20 },
            { name = "OVERCAST", chances = 20 },
            { name = "CLOUDS",   chances = 20 },
            { name = "CLEAR",    chances = 20 }
        },
        enabled = true
    },

    CLOUDS = {
        name = "CLOUDS",
        flow = {
            { name = "FOGGY",    chances = 20 },
            { name = "OVERCAST", chances = 20 },
            { name = "CLOUDS",   chances = 20 },
        },
        enabled = true
    },

    CLEARING = {
        name = "CLEARING",
        flow = {
            { name = "FOGGY",  chances = 20 },
            { name = "CLOUDS", chances = 20 },
        },
        enabled = true
    },

    NEUTRAL = {
        name = "NEUTRAL",
        flow = {
            { name = "OVERCAST", chances = 20 },
            { name = "FOGGY",    chances = 20 },
            { name = "CLOUDS",   chances = 20 }
        },
        enabled = true
    },

    THUNDER = {
        name = "THUNDER",
        flow = {
            { name = "OVERCAST", chances = 20 },
            { name = "CLOUDS",   chances = 20 },
            { name = "FOGGY",    chances = 20 }
        },
        enabled = true
    },

    RAIN = {
        name = "RAIN",
        flow = {
            { name = "RAIN",     chances = 20 },
            { name = "OVERCAST", chances = 20 },
            { name = "CLOUDS",   chances = 20 },
            { name = "FOGGY",    chances = 20 }
        },
        enabled = true
    },

    XMAS = {
        name = "XMAS",
        flow = {
            { name = "XMAS",      chances = 20 },
            { name = "SNOWLIGHT", chances = 20 },
            { name = "BLIZZARD",  chances = 20 },
            { name = "SNOW",      chances = 20 }
        },
        enabled = true
    },

    SNOWLIGHT = {
        name = "SNOWLIGHT",
        flow = {
            { name = "XMAS",      chances = 20 },
            { name = "SNOWLIGHT", chances = 20 },
            { name = "BLIZZARD",  chances = 20 },
            { name = "SNOW",      chances = 20 }
        },
        enabled = true
    },

    BLIZZARD = {
        name = "BLIZZARD",
        flow = {
            { name = "XMAS",      chances = 20 },
            { name = "SNOWLIGHT", chances = 20 },
            { name = "BLIZZARD",  chances = 20 },
            { name = "SNOW",      chances = 20 }
        },
        enabled = true
    },

    SNOW = {
        name = "SNOW",
        flow = {
            { name = "XMAS",      chances = 20 },
            { name = "SNOWLIGHT", chances = 20 },
            { name = "BLIZZARD",  chances = 20 },
            { name = "SNOW",      chances = 20 }
        },
        enabled = true
    }
}
