local updateInterval = 2.0
local timeSinceLastUpdate = 2.0
local currZone = "no zone yet"


function onload(self)
    print(GetAddOnMetadata("TestAddon", "Title") .. " v" .. GetAddOnMetadata("TestAddon", "Version") .. " loaded");
end


function onupdate(self, elapsed)
    timeSinceLastUpdate = timeSinceLastUpdate + elapsed;
    if timeSinceLastUpdate > updateInterval then
        updateNotes()
        timeSinceLastUpdate = 0
    end
end


function updateNotes()
    local newZone = GetZoneText()
    if newZone ~= currZone then
        currZone = newZone
        TestAddon3_MainFrame_xCoorNum:SetText(currZone)
    end
end
