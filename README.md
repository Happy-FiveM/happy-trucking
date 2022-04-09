# happy-trucking
 
Terminals Config
{
    string : name = internal name (won't be displayed)
    string : display = display name (used for destination selection etc)
    vector3 : getJob = place you walk up to to get the job
    array[vector4] : trailerSpawns = legit just an array of spots that will spawn the trailers every site that is deliveryOnly false needs at least one
    vector3 : endJob = where you finish the job
    bool : deliveryOnly = high value jobs could be an endpoint ie you can't pickup a new job (not fucking used cause i'll have a heart attack or aneurysm or some shit)
}
