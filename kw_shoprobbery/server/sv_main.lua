ESX = exports["es_extended"]:getSharedObject()

local Cooldown = {}

lib.callback.register('kw:shoprobbery:CooldownCheck', function(source, key)
    if Cooldown[key] then 
        return true 
    end
end)

lib.callback.register('kw:shoprobbery:SetCooldown', function(source, key)
    if not Cooldown[key] then            
        Cooldown[key] = true 
        SetTimeout(60000*Config.Cooldowntimer, function()
            Cooldown[key] = false
        end)
    end
end)

lib.callback.register('kw:shoprobbery:policeAmount', function(source)
    return #ESX.GetExtendedPlayers('job', 'police')
end)

lib.callback.register('kw:shoprobbery:reward', function(source)
    local playerPos = GetEntityCoords(GetPlayerPed(source))
    local isCloseEnough = false

    for key, coords in ipairs(Config.RegisterCoords) do
        if #(playerPos - coords) <= 4.0 then
            isCloseEnough = true
            break
        end
    end

    if not isCloseEnough then
        local steamid = false
        local license = false
        local discord = false
        local ip = false

        for k, v in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                steamid = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                ip = v:gsub('ip:', '')
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
            end
        end

        local ModColor = 4521984
        local information = "The player used a rewarding callback even though his distance to the necessary coordinates was too big. \nPlayer can be a modder!"
        local identifiers = "Steam ID: "..(steamid or "N/A").."\nLicense: "..(license or "N/A").."\nDiscord:"..'<@' .. discord:gsub('discord:', '') .. '>'.."\nIP Address: "..(ip or "N/A")
        ModderLog(ModColor, information, identifiers)
    end

    if isCloseEnough then
        for _, itemData in ipairs(Config.items) do
            if math.random(1, 100) <= itemData.chance then
                local itemAmount = math.random(itemData.minAmount, itemData.maxAmount)
                exports.ox_inventory:AddItem(source, itemData.item, itemAmount, nil, nil, nil)

                local steamid = false
                local license = false
                local discord = false
                local ip = false
        
                for k, v in pairs(GetPlayerIdentifiers(source)) do
                    if string.sub(v, 1, string.len("steam:")) == "steam:" then
                        steamid = v
                    elseif string.sub(v, 1, string.len("license:")) == "license:" then
                        license = v
                    elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                        ip = v:gsub('ip:', '')
                    elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                        discord = v
                    end
                end

                    local LogColor = 65280
                    local information = string.format('Player robbed shop register and found %s x %s', itemAmount, itemData.item)
                    local identifiers = "Steam ID: "..(steamid or "N/A").."\nLicense: "..(license or "N/A").."\nDiscord:"..'<@' .. discord:gsub('discord:', '') .. '>'.."\nIP Address: "..(ip or "N/A")
                    RobSuccessLog(LogColor, information, identifiers)
            end
        end
    end
end)

function RobSuccessLog(LogColor, information, identifiers)
    local discordWebhookUrl = "WEBHOOK-HERE"
    local embeds = {
        {
            ["color"] = LogColor,
            ["title"] = 'KW TRUCKROB AGENT',
            ["fields"] = {
                {
                    ["name"] = 'Info',
                    ["value"] = information,
                },
                {
                    ["name"] = 'Player data:',
                    ["value"] = identifiers,
                },
            }
        }
    }

    PerformHttpRequest(discordWebhookUrl, function(err, text, headers) end, 'POST', json.encode({username = "KW SHOPROBBERY", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function ModderLog(ModColor, information, identifiers)
    local discordWebhookUrl = "WEBHOOK-HERE"

    local embeds = {
        {
            ["color"] = ModColor,
            ["title"] = 'KW TRUCKROB AGENT',
            ["fields"] = {
                {
                    ["name"] = '**Info**',
                    ["value"] = information,
                },
                {
                    ["name"] = '**Player data:**',
                    ["value"] = identifiers,
                },
            }
        }
    }

    PerformHttpRequest(discordWebhookUrl, function(err, text, headers) end, 'POST', json.encode({username = "KW SHOPROBBERY", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
