Config = {}

Config.RegisterCoords = { -- All coordinates, you can all more if you like!
    vec3(-47.19817, -1759.229, 29.53509),
    vec3(-48.50748, -1347.288, 29.6117),
    vec3(24.94562, -1344.954, 29.6117),
    vec3(24.94562, -1347.288, 29.6117),
    vec3(-1222.331, -907.8234, 12.42084),
    vec3(-1486.673, -378.4638, 30.26789),
    vec3(-1820.465, 793.8166, 138.2128),
    vec3(-1819.091, 792.3151, 138.2057),
    vec3(373.5954, 358.5892, 103.6911),
    vec3(373.0262, 326.3259, 103.6811),
    vec3(1164.56, -324.8947, 69.31918),
    vec3(1164.206, -322.8902, 69.31918),
}

Config.RobItemWanted = 'lockpick' -- false = Player can only rob with item weapon_crowbar
Config.Cooldowntimer = 10 -- in minutes


Config.Targetoptions = {
    label = 'Lockpick', -- You can change this for you liking
    distance = 1.0, -- I've made cheater check on distance between target and closest coordinate. Must be smaller than 4.0 
    icon = 'fa-solid fa-hands', -- Target Icon change here ---> https://fontawesome.com/  <---
    size = vec(1, 1, 1),
    rotation = 365,
    drawSprite = false,
}

Config.NotifyOptions = {
    title = 'Error!',
    description = 'Cooldown is on! Come back later.',
    type = 'error'
}

Config.SkillcheckOptions = {
    levelAreaAndSpeed = {'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, -- You can change the dificulty levels, areasize and speedmultiplayer
    binds = {'E'} -- You can change your skillcheck keybinds
}

Config.Police = {
    neededpolice = 1,
    title = 'Error!',
    description = 'Not enough cops!',
    type = 'error'
}

Config.ProgressOptions = {
    duration = 15000,
    position = 'bottom',
    useWhileDead = false,
    canCancel = true,
    car = true,
    move = true,
    dict = 'missheistfbisetup1',
    clip = 'hassle_intro_loop_f'
}


Config.items = {
    {item = 'cash', minAmount = 57, maxAmount = 1000, chance = 100},
}