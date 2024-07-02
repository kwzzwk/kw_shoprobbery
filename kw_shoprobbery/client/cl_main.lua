ESX = exports["es_extended"]:getSharedObject()

local function PoliceAlarms()
    --Add your policeAlarm here
end


for key, coords in ipairs(Config.RegisterCoords) do
    exports.ox_target:addBoxZone({
        coords = coords,
        size = Config.Targetoptions.size,
        rotation = Config.Targetoptions.rotation,
        debug = drawZones,
        drawSprite = Config.Targetoptions.drawSprite,
        options = {
            {
                label = Config.Targetoptions.label,
                name = 'RobShop',
                icon = Config.Targetoptions.icon,
                distance = Config.Targetoptions.distance,
                item = Config.RobItemWanted,
                onSelect = function()
                    local IsEnoughPolice = lib.callback.await('kw:shoprobbery:policeAmount', false)
                    if IsEnoughPolice < Config.Police.neededpolice then
                        return lib.notify({
                            title = Config.Police.title,
                            description = Config.Police.description,
                            type = Config.Police.type
                        })
                    end

                    local isCooldownOn = lib.callback.await('kw:shoprobbery:CooldownCheck', false, key)
                    if isCooldownOn then
                        return lib.notify({
                            title = Config.NotifyOptions.title,
                            description = Config.NotifyOptions.description,
                            type = Config.NotifyOptions.type
                        })
                    end
                    
                        local success = lib.skillCheck(Config.SkillcheckOptions.levelAreaAndSpeed, Config.SkillcheckOptions.binds)
                        if not success then 
                            Wait(1000)
                            --PoliceAlarms()
                            return true
                        end

                        if lib.progressCircle({
                            duration = Config.ProgressOptions.duration,
                            position = Config.ProgressOptions.position,
                            useWhileDead = Config.ProgressOptions.UseWhileDead,
                            canCancel = Config.ProgressOptions.canCancel,
                            disable = {
                                car = Config.ProgressOptions.car,
                                move = Config.ProgressOptions.move,
                            },
                            anim = {
                                dict = Config.ProgressOptions.dict,
                                clip = Config.ProgressOptions.clip,
                            }
                        }) then
                        lib.callback.await('kw:shoprobbery:reward', source)
                        lib.callback.await('kw:shoprobbery:SetCooldown', false, key)
                        end
                    end
                    }
                }
            })
        end