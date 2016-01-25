--[[
    by LYQ(Virose / MOUZU)
    https://github.com/MOUZU/BigWigs
    
    This is a small plugin which is inspired by later Bossmod versions which included a module to record
    the time in bossfights and displays the time after kill and also a small comparison to your fastest kill.
--]]

------------------------------
--      Are you local?      --
------------------------------
local c = {
    name        = "",
    startTime   = 0,
    lastKill    = 0,
}
local prefix = "|cf75DE52f[BigWigs]|r - ";

----------------------------
--      Localization      --
----------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsBossRecords")
L:RegisterTranslations("enUS", function() return {
    BOSS_ENGAGED    = "%s engaged. Good luck and have fun! :)",
    BOSS_DOWN		= "%s down after %s!",
    BOSS_DOWN_I		= "%s down! You have %d total victories.",
    BOSS_DOWN_L		= "%s down after %s! Your last kill took %s and your fastest kill took %s. You have %d total victories.",
    BOSS_DOWN_NR	= "%s down after %s! This is a new record! (Old record was %s). You have %d total victories.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsBossRecords = BigWigs:NewModule("BossRecords")

------------------------------
--      Initialization      --
------------------------------

function BigWigsBossRecords:OnEnable()
    self:RegisterEvent("BigWigs_BossDeath")
    self:RegisterEvent("BigWigs_RecvSync")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsBossRecords:BigWigs_RecvSync(sync, rest)
    if sync == "BossEngaged" and rest and rest ~= "" and ((c.startTime + 5) < GetTime()) then
        c.name      = rest
        c.startTime = GetTime()
        
        DEFAULT_CHAT_FRAME:AddMessage(prefix .. string.format(L["BOSS_ENGAGED"], rest))
        self:TriggerEvent("BigWigs_Message", rest .. " engaged!", "Positive")
    end
end

function BigWigsBossRecords:BigWigs_BossDeath(name)
    -- just to be sure that we're not calculating/tracking bullshit
    if c.name == name and ((c.lastKill + 5) < GetTime()) then
        local timeSpent = GetTime() - c.startTime
        c.lastKill      = GetTime()
        
        if false then
            -- TODO: if we have data already
            if false then
                -- TODO if it's a new record
            else
                -- TODO else just display the last and best entry
            end
        else
            -- it's our first kill
            DEFAULT_CHAT_FRAME:AddMessage(prefix .. string.format(L["BOSS_DOWN"], name, timeSpent))
        end
    end
end