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
    name = "",
    startTime = 0,
}

----------------------------
--      Localization      --
----------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsBossRecords")
L:RegisterTranslations("enUS", function() return {
    boss_engaged        = "%s engaged. Good luck and have fun! :)",
    
    DBM_CORE_BOSS_DOWN					= "%s down after %s!",
    DBM_CORE_BOSS_DOWN_I				= "%s down! You have %d total victories.",
    DBM_CORE_BOSS_DOWN_L				= "%s down after %s! Your last kill took %s and your fastest kill took %s. You have %d total victories.",
    DBM_CORE_BOSS_DOWN_NR				= "%s down after %s! This is a new record! (Old record was %s). You have %d total victories.",
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

function BigWigsBossRecords:BigWigs_RecvSync()
    if sync == "BossEngaged" and rest and rest ~= "" then
        c.name      = rest
        c.startTime = GetTime()
        -- todo engage chat message
        SendChat("BigWigsBossRecords TEST - "..rest.." ENGAGED!")
    end
end

function BigWigsBossRecords:BigWigs_BossDeath(name)
    -- just to be sure that we're not calculating/tracking bullshit
    if c.name == name then
        local timeSpent = GetTime() - c.startTime
        SendChat("BigWigsBossRecords TEST - "..name.." KILLED!")
        -- todo bossdeath chat message
        -- todo fill savedvariables
        -- todo load from savedvariables and compare time - check if it's the fastest kill, if not display the fastest
        
        -- to rethink: does Thekal in ZG work properly with this logic? Is there another boss similar to Thekal?
    end
end