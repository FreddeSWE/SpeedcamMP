
local M = {}

local function onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)
    local obj = be:getObjectByID(speedTrapData.subjectID)
    speedTrapData.licensePlate = obj:getDynDataFieldbyName("licenseText", 0) or "Illegible"
    speedTrapData.vehicleModel = core_vehicles.getModel(obj.JBeam).model.Name
    speedTrapData.playerSpeed = playerSpeed
    speedTrapData.overSpeed = overSpeed
    TriggerServerEvent("speedTrap", jsonEncode( speedTrapData ) )
end

local function onRedLightCamTriggered(speedTrapData, playerSpeed)
    local obj = be:getObjectByID(speedTrapData.subjectID)
    speedTrapData.licensePlate = obj:getDynDataFieldbyName("licenseText", 0) or "Illegible"
    speedTrapData.vehicleModel = core_vehicles.getModel(obj.JBeam).model.Name
    speedTrapData.playerSpeed = playerSpeed
    speedTrapData.overSpeed = overSpeed
    TriggerServerEvent("redLight", jsonEncode( speedTrapData ) )
end


local function onExtensionLoaded()
	log('W', 'speedcamera', 'speedcam LOADED!')
end

local function onExtensionUnloaded()
	log('W', 'speedcamera', 'speedcam UNLOADED!')
end

M.onSpeedTrapTriggered = onSpeedTrapTriggered
M.onRedLightCamTriggered = onRedLightCamTriggered

M.onInit = function() setExtensionUnloadMode(M, 'manual') end

M.onExtensionLoaded = onExtensionLoaded
M.onExtensionUnloaded = onExtensionUnloaded

return M
