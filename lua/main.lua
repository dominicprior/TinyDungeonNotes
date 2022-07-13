local updateInterval = 5.0
local timeSinceLastUpdate = 5.0


function onload(self)
    print(GetAddOnMetadata("TestAddon", "Title") .. " v" .. GetAddOnMetadata("TestAddon", "Version") .. " loaded");
end


function onupdate(self, elapsed)
    timeSinceLastUpdate = timeSinceLastUpdate + elapsed;
    if timeSinceLastUpdate > updateInterval then
        updateNotes()
        timeSinceLastUpdate = 0;
    end
end


function updateNotes()
    local zone = GetZoneText()
    TestAddon3_MainFrame_xCoorNum:SetText(zone)
end
