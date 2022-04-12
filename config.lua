
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
        jobInProgress = false,
        currentDestination = nill,
    },
    Terminals = {
        docks = {
            name = 'docks',
            display = 'International Docks',
            getJob = vector3(917.52, -3239.92, 5.9),
            endJob = vector3(933.21, -3188.43, 5.9),
            cancelJob = {
                center = vector3(995.55, -3210.48, 5.9),
                radius = 30.0,
            },
            trailerSpawns = {
                vector4(896.51, -3208.65, 5.9, 178.71),
                vector4(900.51, -3208.65, 5.9, 178.71),
                vector4(904.51, -3208.65, 5.9, 178.71),
                vector4(908.51, -3208.65, 5.9, 178.71),
                vector4(912.51, -3208.65, 5.9, 178.71),
            },
            truckSpawns = {
                vector4(989.55, -3210.46, 5.9, 175.45),
                vector4(993.55, -3210.46, 5.9, 175.45),
                vector4(997.55, -3210.46, 5.9, 175.45),
                vector4(1001.55, -3210.46, 5.9, 175.45),
            },
            destinations = {
                'cluckin',
                'lumber',
                'refinery',
                'power',
                'youtool',
            },
            trailersToLocation = {
                'trailers',
                'trailers4',
                'tanker',
            },
            deliveryOnly = false,
        },
        lsia = {
            name = 'lsia',
            display = 'Los Santos International Airport',
            getJob = vector3(-1072.8, -2183.97, 13.39),
            endJob = vector3(-1036.35, -2213.36, 8.98),
            cancelJob = {
                center = vector3(-1081.92, -2156.11, 13.4),
                radius = 20,
            },
            trailerSpawns = {
                vector4(-1132.94, -2228.75, 13.2, 329.09),
                vector4(-1136.87, -2222.95, 13.2, 329.09),
                vector4(-1141.76, -2219.9, 13.2, 329.09),
            },
            truckSpawns = {
                vector4(-1078.11, -2152.7, 13.4, 42.3),
                vector4(-1080.79, -2155.14, 13.4, 42.3),
                vector4(-1080.79, -2155.14, 13.4, 42.3),
            },
            destinations = {
                'cluckin',
                'lumber',
                'power',
                'refinery',
                'youtool',
                'docks',
            },
            trailersToLocation = {
                'trailers',
                'trailers2',
                'trailers3',
                'trailers4',
                'tr4',
                'tanker',
            },
            deliveryOnly = false,
        },
        lumber = {
            name = 'lumber',
            display = 'Lumberyard',
            getJob = vector3(-567.33, 5253.07, 70.47),
            endJob = vector3(-509.19, 5241.6, 80.3),
            cancelJob = {
                center = vector3(-571.92, 5371.34, 70.22),
                radius = 25.0,
            },
            trailerSpawns = {
                vector4(-600.07, 5288.26, 70.23, 225.25),
                vector4(-601.23, 5294.66, 70.21, 225.25),
                vector4(-601.75, 5301.85, 70.21, 225.25),
            },
            truckSpawns =  {
                vector4(-575.14, 5370.0, 70.24, 241.57),
                vector4(-572.26, 5374.04, 70.23, 241.57),
            },
            destinations = {
                'cluckin',
                'refinery',
                'youtool',
                'lsia',
                'docks',
            },
            trailersToLocation = {
                'trailerlogs',
            },
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
            trailerSpawns = {
                vector4(2890.56, 4402.6, 50.26, 187.08),
                vector4(2932.18, 4346.11, 52.01, 20.73),
            },
            truckSpawns = {
                vector4(2907.59, 4398.2, 50.26, 24.36),
                vector4(2904.53, 4396.4, 50.27, 26.08),
            },
            destinations = {
                'cluckin',
                'lumber',
                'lsia',
                'docks',
            },
            trailersToLocation = {
                'trailers',
                'trailers4',
                'tanker',
            },
            deliveryOnly = false,
        },
        power = {
            name = 'power',
            display = 'Palmer-Taylor Power Station',
            getJob = vector3(2747.95, 1452.59, 24.49),
            endJob = vector3(2832.95, 1471.15, 24.56),
            cancelJob = {
                center = vector3(2723.49, 1361.57, 24.52),
                radius = 35.0,
            },
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
            trailersToLocation = {
                'trailers',
                'trailers4',
                'tanker',
            },
            deliveryOnly = false,
        },
        youtool = {
            name = 'youtool',
            display = 'Youtool',
            getJob = vector3(2709.91, 3455.15, 56.32),
            endJob = vector3(2680.6, 3458.03, 55.75),
            cancelJob = {
                center = vector3(2675.0, 3521.15, 52.71),
                radius = 20.0,
            },
            trailerSpawns = {
                vector4(2670.87, 3513.56, 52.71, 62.47),
                vector4(2674.22, 3517.41, 52.71, 65.91),
                vector4(2675.0, 3521.15, 52.71, 60.06),
                vector4(2676.15, 3524.59, 52.59, 53.91),
            },
            truckSpawns = {
                vector4(2739.36, 3409.42, 56.69, 327.54),
                vector4(2735.44, 3410.67, 56.74, 337.38),
            },
            destinations = {
                'cluckin',
                'lumber',
                'lsia',
                'docks',
            },
            trailersToLocation = {
                'trailers',
                'trailers2',
                'trailers3',
                'trailers4',
            },
            deliveryOnly = false,
        },
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
            model = 'hauler',
            trailerIncluded = false,
        },
        {
            model = 'pounder',
            trailerIncluded = true,
        },
        {
            model = 'mule',
            trailerIncluded = true,
        },
        {
            model = 'mule2',
            trailerIncluded = true,
        },
        {
            model = 'mule3',
            trailerIncluded = true,
        },
        {
            model = 'benson',
            trailerIncluded = true
        }
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