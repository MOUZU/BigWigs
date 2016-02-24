--[[
    by LYQ(Virose / MOUZU)
    https://github.com/MOUZU/BigWigs
    
    This is a small plugin which is inspired by Sulfuras of Mesmerize (Warsong/Feenix).
    It gives the RaidOfficers the opportunity to "disconnect" RaidMembers who are AFK flagged.

    The initial version of Sulfuras could be abused to kick random players in your raidgroup
    and therefore this feature was seen as abuse but the intent of it isn't that wrong after all.

    I therefore recreated the feature using his idea and implemented it with a couple of
    safety measures from my side.
--]]

------------------------------
--      Are you local?      --
------------------------------


----------------------------
--      Localization      --
----------------------------


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsAFKick = BigWigs:NewModule("AFKick")

------------------------------
--      Initialization      --
------------------------------

function BigWigsAFKick:OnEnable()
    self:RegisterEvent("BigWigs_RecvSync")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsAFKick:BigWigs_RecvSync(sync, rest, nick)
    if sync == "AFKick" and rest and (nick) then
        
    end
end

function BigWigsAFKick:IsAfk()
    return false
end