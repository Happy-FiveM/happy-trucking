-- Terminals Config
-- {
--     string : name = internal name (won't be displayed)
--     string : display = display name (used for destination selection etc)
--     vector3 : getJob = place you walk up to to get the job
--     array[vector4] : trailerSpawns = legit just an array of spots that will spawn the trailers every site that is deliveryOnly false needs at least one
--     vector3 : endJob = where you finish the job
--     bool : deliveryOnly = high value jobs could be an endpoint ie you can't pickup a new job (not fucking used cause i'll have a heart attack or aneurysm or some shit)
-- }

Config = {
    Terminals = {
        {
            name = 'docks',
            display = 'International Docks',
            getJob = vector3(917.52, -3239.92, 5.9),
            endJob = vector3(933.21, -3188.43, 5.9), 
            deliveryOnly = false,
        },
        {
            name = 'lsia',
            display = 'Los Santos International Airport',
            getJob = vector3(-1072.8, -2183.97, 13.39),
            endJob = vector3(-1036.35, -2213.36, 8.98),
            deliveryOnly = false,
        },
        {
            name = 'lumber',
            display = 'Lumberyard',
            getJob = vector3(-567.33, 5253.07, 70.47),
            endJob = vector3(-509.19, 5241.6, 80.3),
            deliveryOnly = false,
        },
        {
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
        {
            name = 'refinery',
            display = 'Chianski Refinery',
            getJob = vector3(2916.3, 4368.04, 50.46),
            deliveryOnly = false,
        },
        {
            name = 'quarry',
            display = 'Davis Quartz Quarry',
            getJob = vector3(2707.29, 2776.71, 37.88),
            deliveryOnly = false,
        },
        {
            name = 'power',
            display = 'Palmer-Taylor Power Station',
            getJob = vector3(2748.43, 1453.73, 24.5),
            deliveryOnly = false,
        },
        {
            name = 'youtool',
            display = 'Youtool',
            getJob = vector3(2709.91, 3455.15, 56.32),
            deliveryOnly = false,
        },
    },
    Trucks = {
        Packer = {
            model = 'packer',
            TrailerIncluded = false,
        },
        Phantom = {
            model = 'phantom',
            TrailerIncluded = false,
        },
        Phantom3 = {
            model = 'phantom3',
            TrailerIncluded = false,
        },
        Hauler = {
            model = 'hauler',
            TrailerIncluded = false,
        },
        Pounder = {
            model = 'pounder',
            TrailerIncluded = true,
        },
        Mule = {
            model = 'mule',
            TrailerIncluded = true,
        },
        Mule2 = {
            model = 'mule2',
            TrailerIncluded = true,
        },
        Mule3 = {
            model = 'mule3',
            TrailerIncluded = true,
        },
        Benson = {
            model = 'benson',
            TrailerIncluded = true
        }
    },
    Trailers = {
        Container1 = 'trailers4',
        Container2 = 'trailers',
        Container3 = 'trailers2',
        Container4 = 'trailers3',
        CarTrailer = 'tr4',
        BailTrailer = 'baletrailer',
        TankerTrailer = 'tanker',
        LogsTrailer = 'trailerlogs',
        TvTrailer = 'tvtrailer',
    }
}