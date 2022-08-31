ESX = exports['es_extended']:getSharedObject()

Config = {
    General = {
        blip = { -- wouldn't normally do blips in the script, usually have my own blips script or part of my custom core powered by db tables
            sprite = 477, -- radar_truck
            colour = 0, -- white
            scale = 0.6,
            shortRange = true,
            label = 'Trucking',
            display = 2, -- minimap and main map (selectable)
        },
        JobState = {
            jobInProgress = false,
            currentDestination = nil,
            truckAtDestination = false,
            trailerRequired = false,
            currentTruck = nil
        },
        debug = false, -- just affects whether we show polyzone debug
        getJobPedModel = `s_m_y_airworker`, -- just the ped we use to do the job management, get's targeted individually as an entity when they exist
        distanceToMoneyFactorial = 0.6, -- pay is primarily calculated by distance, this is the modifier to distance so if distance is 1000 and modifier is 0.7, base pay will be 700
        payVariationMax = 1000 -- this is the maximum the base pay can be modified by, to add variation to money earned for the same journey we do a math.random on this bitch and add to the base pay
    },
    Terminals = {
        docks = {
            name = 'docks',
            display = 'International Docks',
            getJob = vec4(917.48, -3239.69, 4.895, 9.41),
            trailerSpawns = {
                vec4(896.51, -3208.65, 5.9, 178.71),
                vec4(900.51, -3208.65, 5.9, 178.71),
                vec4(904.51, -3208.65, 5.9, 178.71),
                vec4(908.51, -3208.65, 5.9, 178.71),
                vec4(912.51, -3208.65, 5.9, 178.71),
            },
            truckSpawns = {
                vec4(989.55, -3210.46, 5.9, 175.45),
                vec4(993.55, -3210.46, 5.9, 175.45),
                vec4(997.55, -3210.46, 5.9, 175.45),
                vec4(1001.55, -3210.46, 5.9, 175.45),
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
            getJob = vec4(-1072.8, -2183.97, 12.39, 42.84),
            trailerSpawns = {
                vec4(-1132.94, -2228.75, 13.2, 329.09),
                vec4(-1136.87, -2222.95, 13.2, 329.09),
                vec4(-1141.76, -2219.9, 13.2, 329.09),
            },
            truckSpawns = {
                vec4(-1078.11, -2152.7, 13.4, 42.3),
                vec4(-1080.79, -2155.14, 13.4, 42.3),
                vec4(-1080.79, -2155.14, 13.4, 42.3),
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
        },
        lumber = {
            name = 'lumber',
            display = 'Lumberyard',
            getJob = vec4(-567.77, 5253.3, 69.49, 69.29),
            trailerSpawns = {
                vec4(-600.07, 5288.26, 70.23, 225.25),
                vec4(-601.23, 5294.66, 70.21, 225.25),
                vec4(-601.75, 5301.85, 70.21, 225.25),
            },
            truckSpawns =  {
                vec4(-575.14, 5370.0, 70.24, 241.57),
                vec4(-572.26, 5374.04, 70.23, 241.57),
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
        },
        cluckin = {
            name = 'cluckin',
            display = 'Cluckin Bell Factory',
            getJob = vec4(122.39, 6406.04, 30.35, 311.81),
            trailerSpawns = {
                vec4(147.53, 6413.94, 31.24, 78.94),
                vec4(153.27, 6415.6, 30.98, 73.57),
                vec4(156.31, 6418.19, 31.08, 70.88),
            },
            truckSpawns = {
                vec4(121.37, 6419.6, 31.37, 307.74),
            },
            deliveryOnly = false,
            destinations = {
                'lsia',
                'docks',
            },
            trailersToLocation = {
                'trailers',
                'trailers4',
                'tanker',
            },
        },
        refinery = {
            name = 'refinery',
            display = 'Chianski Refinery',
            getJob = vec4(2915.82, 4368.22, 49.45, 60.18),
            trailerSpawns = {
                vec4(2890.56, 4402.6, 50.26, 187.08),
                vec4(2932.18, 4346.11, 52.01, 20.73),
            },
            truckSpawns = {
                vec4(2907.59, 4398.2, 50.26, 24.36),
                vec4(2904.53, 4396.4, 50.27, 26.08),
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
        },
        power = {
            name = 'power',
            display = 'Palmer-Taylor Power Station',
            getJob = vec4(2747.95, 1452.59, 23.49, 165.47),
            trailerSpawns = {
                vec4(2831.02, 1626.66, 24.57, 139.83),
                vec4(2830.72, 1633.94, 24.59, 142.3),
                vec4(2832.55, 1643.95, 24.65, 140.73),
            },
            truckSpawns = {
                vec4(2703.17, 1374.25, 24.5, 0.07),
                vec4(2706.82, 1373.44, 24.5, 0.29),
                vec4(2710.3, 1373.53, 24.5, 0.5),
                vec4(2717.82, 1373.37, 24.5, 359.12),
                vec4(2721.36, 1373.4, 24.5, 0.35),
                vec4(2725.0, 1373.7, 24.5, 359.48),
                vec4(2728.75, 1374.03, 24.5, 359.51),
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
        },
        youtool = {
            name = 'youtool',
            display = 'Youtool',
            getJob = vec4(2709.91, 3455.15, 55.32, 157.53),
            trailerSpawns = {
                vec4(2670.87, 3513.56, 52.71, 62.47),
                vec4(2674.22, 3517.41, 52.71, 65.91),
                vec4(2675.0, 3521.15, 52.71, 60.06),
                vec4(2676.15, 3524.59, 52.59, 53.91),
            },
            truckSpawns = {
                vec4(2739.36, 3409.42, 56.69, 327.54),
                vec4(2735.44, 3410.67, 56.74, 337.38),
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