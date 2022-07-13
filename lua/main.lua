colorencode_updateInterval = 5.0
colorencode_sinceLastUpdate = 5.0


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
    local zone = GetZoneText()
    TestAddon3_MainFrame_xCoorNum:SetText([[one
two
three
four  ]] .. zone)
end
