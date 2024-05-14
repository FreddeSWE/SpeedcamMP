
local triggerPlaces = {
    [1] = "Plaza Intersection",
    [2] = "Plaza Hwy North",
    [3] = "Plaza Hwy South",
    [4] = "Beach road",
    [5] = "Island Lighthouse",
    [6] = "Island Port North",
    [7] = "Island Port South"
}

function onInit()
    MP.RegisterEvent("speedTrap", "speedTrap")
    MP.RegisterEvent("redLight", "redLight")
    print("SpeedcamMP Loaded!")
end

function speedTrap(player_id, data)
    local speedTrapData = Util.JsonDecode(data)
    local triggerName = speedTrapData.triggerName
    local triggerNumber = tonumber(string.match(triggerName, "%d+"))
    local triggerPlace = triggerPlaces[triggerNumber] or "Unknown"
    local player_name = MP.GetPlayerName(player_id)
    MP.SendChatMessage( -1, "Speed Violation by " .. player_name .. "!")
    MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.playerSpeed * 2.23694 ) .. " MPH in " .. string.format( "%.0f", speedTrapData.speedLimit * 2.23694 ) .. " MPH Zone" )
    MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.overSpeed * 2.23694 ) .. " MPH over Limit!" )
    MP.SendChatMessage( -1, "Speeding Violation at " .. triggerPlace )
    MP.SendChatMessage( -1, "Vehicle: " .. speedTrapData.vehicleModel )
    MP.SendChatMessage( -1, "Plate: " .. speedTrapData.licensePlate )
end

function redLight(player_id, data)
    local speedTrapData = Util.JsonDecode(data)
    local triggerName = speedTrapData.triggerName
    local triggerNumber = tonumber(string.match(triggerName, "%d+"))
    local triggerPlace = triggerPlaces[triggerNumber] or "Unknown"
    local player_name = MP.GetPlayerName(player_id)
    MP.SendChatMessage( -1, "Red light violation by " .. player_name .. "!")
    --MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.playerSpeed * 2.23694 ) .. " MPH in " .. string.format( "%.0f", speedTrapData.speedLimit * 2.23694 ) .. " MPH Zone" )
    --MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.overSpeed * 2.23694 ) .. " MPH over Limit!" )
    MP.SendChatMessage( -1, "Red Light violation at " .. triggerPlace )
    MP.SendChatMessage( -1, "Vehicle: " .. speedTrapData.vehicleModel )
    MP.SendChatMessage( -1, "Plate: " .. speedTrapData.licensePlate )
end
