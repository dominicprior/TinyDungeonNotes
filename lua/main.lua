local updateInterval = 2.0
local timeSinceLastUpdate = 2.0
local currZone = "no zone yet"

local notes = {

{'ironforge',
[[hello
IF]]
},
{'shattrath',
[[hello
SH]]
}

}


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
        local note = findNote(currZone)
        TestAddon3_MainFrame_xCoorNum:SetText(note)
    end
end

function findNote(zone)
    for k, patternAndNote in pairs(notes) do
        local pattern = string.lower(patternAndNote[1])
        if string.find(string.lower(zone), pattern) then
            return patternAndNote[2]
        end
    end
    return 'hey ' .. zone
end
