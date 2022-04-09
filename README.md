# happy-trucking
 


# Config
## Terminals Config
```
power = { -- this should match the name
    name = 'power', -- this should match the terminal key
    display = 'Palmer-Taylor Power Station', -- display name for the delivery terminal, this can be whatever you want
    getJob = vector4(2747.95, 1452.59, 24.49, 343.94), -- The spot to create the circleZone to receive the job
    endJob = vector3(2832.95, 1471.15, 24.56), -- The spot to create the circleZone to end deliveries
    trailerSpawns = { -- array of trailer spawn points
        vector4(2831.02, 1626.66, 24.57, 139.83),
        vector4(2830.72, 1633.94, 24.59, 142.3),
        vector4(2832.55, 1643.95, 24.65, 140.73),
    },
    truckSpawns = { -- array of truck spawns
        vector4(2703.17, 1374.25, 24.5, 0.07),
        vector4(2706.82, 1373.44, 24.5, 0.29),
        vector4(2710.3, 1373.53, 24.5, 0.5),
        vector4(2717.82, 1373.37, 24.5, 359.12),
        vector4(2721.36, 1373.4, 24.5, 0.35),
        vector4(2725.0, 1373.7, 24.5, 359.48),
        vector4(2728.75, 1374.03, 24.5, 359.51),
    },
    destinations = { -- list of places you can deliver to from this location should match the name and terminal key
        'cluckin',
        'lumber',
        'lsia',
        'docks',
    },
    trailersToLocation = { -- list of trailers that you can delivery to this location
        'trailers',
        'trailers4',
        'tanker',
    },
    deliveryOnly = false, -- this would stop you from getting new jobs from this location
}
```
