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
    end
end

function BigWigsBossRecords:BigWigs_BossDeath(name)
    -- just to be sure that we're not calculating/tracking bullshit
    if c.name == name then
        local timeSpent = GetTime() - c.startTime
        -- todo bossdeath chat message
        -- todo fill savedvariables
        -- todo load from savedvariables and compare time - check if it's the fastest kill, if not display the fastest
        
        -- to rethink: does Thekal in ZG work properly with this logic? Is there another boss similar to Thekal?
    end
end