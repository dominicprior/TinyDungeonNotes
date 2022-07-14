local updateInterval = 2.0
local timeSinceLastUpdate = 2.0
local currZone = "no zone yet"

local notes = {

{'slave pens',
[[Champion - fear
Ray - fear
Soothsayer - MC]]},

{'mana.tombs',
[[Nexus Terror - fear
Pandemonius - reflect
Darkcaster - mana burn
Theurgist - sheep]]},

{'auchenai crypts',
[[Possessor - MC]]},

{'sethekk',
[[Controller - MC totem
Prophet - fear, ghost
Oracle - chain lightning
Serpent - knock back?]]},

{'hillsbrad',
[[Warden - fear]]},

{'shadow labyrinth',
[[Fel Overseer - fear
Deathsworn - stun
Acolyte - heal
Assassin - stealth
Spellbinder - MC]]},

{'mechanar',
[[Sunseeker - summons adds
Physician - anesthetic
Tinkerer - high priority
Capacitus - bombs, reflects when red]]},

{'steamvault',
[[Siren - fear
Bog Overload - poison cloud
Oracle - aoe silence]]},

{'black morass',
[[Rift Keeper - sheep, fear, pyroblast
Temporus - no taunt, healing debuff (disarm), reflect
Aoenus - face him away]]},

{'botanica',
[[no botanica info yet]]},

{'arcatraz',
[[no arcatraz info yet]]},

}


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
    return zone
end
