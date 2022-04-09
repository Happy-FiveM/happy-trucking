
-- {coords = vector3(-702.49, 270.19, 83.15), sprite = 40, colour = 2, scale = 0.6, shortRange = true, label = 'Dynasty 8', display = 6},
Config = {
    General = {
        blip = {
            sprite = 477, -- radar_truck
            colour = 0, -- white
            scale = 0.6,
            shortRange = true,
            label = 'Trucking',
            display = 2, -- minimap and main map (selectable)
        },
        debug = true,
    },
    Terminals = {
        docks = {
            name = 'docks',
            display = 'International Docks',
            getJob = vector3(917.52, -3239.92, 5.9),
            endJob = vector3(933.21, -3188.43, 5.9), 
            deliveryOnly = false,
        },
        lsia = {
            name = 'lsia',
            display = 'Los Santos International Airport',
            getJob = vector3(-1072.8, -2183.97, 13.39),
            endJob = vector3(-1036.35, -2213.36, 8.98),
            deliveryOnly = false,
        },
        lumber = {
            name = 'lumber',
            display = 'Lumberyard',
            getJob = vector3(-567.33, 5253.07, 70.47),
            endJob = vector3(-509.19, 5241.6, 80.3),
            deliveryOnly = false,
        },
        cluckin = {
            name = 'cluckin',
            display = 'Cluckin Bell Factory',
            getJob = vector3(122.05, 6405.63, 31.35),
            endJob = vector3(199.3, 6405.3, 31.37),
            trailerSpawns = {
                vector4(147.53, 6413.94, 31.24, 78.94),
                vector4(153.27, 6415.6, 30.98, 73.57),
                vector4(156.31, 6418.19, 31.08, 70.88),
            },
            deliveryOnly = false,
        },
        refinery = {
            name = 'refinery',
            display = 'Chianski Refinery',
            getJob = vector3(2916.3, 4368.04, 50.46),
            endJob = vector3(2933.29, 4309.7, 50.95),
            deliveryOnly = false,
        },
        power = {
            name = 'power',
            display = 'Palmer-Taylor Power Station',
            getJob = vector4(2747.95, 1452.59, 24.49, 343.94),
            endJob = vector3(2832.95, 1471.15, 24.56),
            trailerSpawns = {
                vector4(2831.02, 1626.66, 24.57, 139.83),
                vector4(2830.72, 1633.94, 24.59, 142.3),
                vector4(2832.55, 1643.95, 24.65, 140.73),
            },
            truckSpawns = {
                vector4(2703.17, 1374.25, 24.5, 0.07),
                vector4(2706.82, 1373.44, 24.5, 0.29),
                vector4(2710.3, 1373.53, 24.5, 0.5),
                vector4(2717.82, 1373.37, 24.5, 359.12),
                vector4(2721.36, 1373.4, 24.5, 0.35),
                vector4(2725.0, 1373.7, 24.5, 359.48),
                vector4(2728.75, 1374.03, 24.5, 359.51),
            },
            destinations = {
                'cluckin',
                'lumber',
                'lsia',
                'docks',
            },
            deliveryOnly = false,
        },
        youtool = {
            name = 'youtool',
            display = 'Youtool',
            getJob = vector3(2709.91, 3455.15, 56.32),
            endJob = vector3(2680.6, 3458.03, 55.75),
            deliveryOnly = false,
        },
        -- {
        --     name = 'quarry',
        --     display = 'Davis Quartz Quarry',
        --     getJob = vector3(2707.29, 2776.71, 37.88),
        --     deliveryOnly = false,
        -- },
    },
    Trucks = {
        {
            model = 'packer',
            trailerIncluded = false,
        },
        {
            model = 'phantom',
            trailerIncluded = false,
        },
        {
            model = 'phantom3',
            trailerIncluded = false,
        },
        {
            model = 'hauler',
            trailerIncluded = false,
        },
        -- {
        --     model = 'pounder',
        --     trailerIncluded = true,
        -- },
        -- {
        --     model = 'mule',
        --     trailerIncluded = true,
        -- },
        -- {
        --     model = 'mule2',
        --     trailerIncluded = true,
        -- },
        -- {
        --     model = 'mule3',
        --     trailerIncluded = true,
        -- },
        -- {
        --     model = 'benson',
        --     trailerIncluded = true
        -- }
    },
    Trailers = {
        'trailers',
        'trailers2',
        'trailers3',
        'trailers4',
        'tr4',
        'tanker',
        'trailerlogs',
        'tvtrailer',
    }
}