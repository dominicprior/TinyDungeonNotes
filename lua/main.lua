colorencode_updateInterval = 1.0
colorencode_sinceLastUpdate = 1.0


function onload(self)
    print(GetAddOnMetadata("TestAddon", "Title") .. " v" .. GetAddOnMetadata("TestAddon", "Version") .. " loaded");
end


function onupdate(self, elapsed)
    colorencode_sinceLastUpdate = colorencode_sinceLastUpdate + elapsed;  
    if (colorencode_sinceLastUpdate > colorencode_updateInterval) then
        -- CODE
        updateCoor()

        colorencode_sinceLastUpdate = 0;
    end
end


function updateCoor()
    local mapID = C_Map.GetBestMapForUnit("player")

    local position = C_Map.GetPlayerMapPosition(mapID, "player")
    local azimuth = GetPlayerFacing()

    position.x = math.floor(position.x * 10000) / 100

    TestAddon3_MainFrame_xCoorNum:SetText('h \n h' .. position.x)
end
