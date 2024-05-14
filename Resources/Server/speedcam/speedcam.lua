
local triggerPlaces = {
    [1] = "China Town Red Light",
    [2] = "Plaza North Bound",
    [3] = "Plaza South Bound",
    [4] = "Beach",
    [5] = "Lighthouse",
    [6] = "Island Port North Bound",
    [7] = "Island Port South Bound"
}

function onInit()
    MP.RegisterEvent("speedTrap", "speedTrap")
    MP.RegisterEvent("redLight", "redLight")
    print("Speed Trap Logger Loaded!")
end

function speedTrap(player_id, data)
    local speedTrapData = Util.JsonDecode(data)
    local triggerName = speedTrapData.triggerName
    local triggerNumber = tonumber(string.match(triggerName, "%d+"))
    local triggerPlace = triggerPlaces[triggerNumber] or "Unknown"
    local player_name = MP.GetPlayerName(player_id)
    --MP.SendChatMessage( -1, "Speed Violation by " .. player_name .. "!")
    --MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.playerSpeed * 2.23694 ) .. " MPH in " .. string.format( "%.0f", speedTrapData.speedLimit * 2.23694 ) .. " MPH Zone" )
    --MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.overSpeed * 2.23694 ) .. " MPH over Limit!" )
    MP.SendChatMessage( -1, triggerPlace .. " Speed Trap triggered")
    --MP.SendChatMessage( -1, "Vehicle: " .. speedTrapData.vehicleModel )
    --MP.SendChatMessage( -1, "Plate: " .. speedTrapData.licensePlate )
end

function redLight(player_id, data)
    local speedTrapData = Util.JsonDecode(data)
    local triggerName = speedTrapData.triggerName
    local triggerNumber = tonumber(string.match(triggerName, "%d+"))
    local triggerPlace = triggerPlaces[triggerNumber] or "Unknown"
    local player_name = MP.GetPlayerName(player_id)
    --MP.SendChatMessage( -1, "Speed Violation by " .. player_name .. "!")
    --MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.playerSpeed * 2.23694 ) .. " MPH in " .. string.format( "%.0f", speedTrapData.speedLimit * 2.23694 ) .. " MPH Zone" )
    --MP.SendChatMessage( -1, string.format( "%.1f", speedTrapData.overSpeed * 2.23694 ) .. " MPH over Limit!" )
    MP.SendChatMessage( -1, triggerPlace .. " Speed Trap triggered")
    --MP.SendChatMessage( -1, "Vehicle: " .. speedTrapData.vehicleModel )
    --MP.SendChatMessage( -1, "Plate: " .. speedTrapData.licensePlate )
end
