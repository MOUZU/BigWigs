--[[
    by LYQ(Virose / MOUZU)
    https://github.com/MOUZU/BigWigs
    
    This is a small plugin to make the ReadyCheck from later expansions usable.
--]]

------------------------------
--      Are you local?      --
------------------------------
local c = {
    lastReadyCheck  = 0,
    list            = {
        -- this list is resetting every finished ready check
        -- it keeps track of the results from the ongoing ready check
        -- [player] = response,
    },
}

----------------------------
--      Localization      --
----------------------------


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsReadyCheck = BigWigs:NewModule("ReadyCheck")

------------------------------
--      Initialization      --
------------------------------

function BigWigsReadyCheck:OnEnable()
    self:RegisterEvent("BigWigs_RecvSync")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsReadyCheck:BigWigs_RecvSync(sync, rest, nick)
    if sync == "RequestReadyCheck" and nick ~= UnitName("player") then
        c.lastReadyCheck = GetTime()
        --self:TriggerEvent("BigWigs_SendSync", "ConfirmReadyCheck")
    elseif sync == "ConfirmReadyCheck" then
        if not c.list[nick] then
            if rest == "ready" then

            else
                
            end
            c.list[nick] = rest
        end
    end
end

function BigWigsReadyCheck:StartReadyCheck()
    if (IsRaidLeader() or IsRaidOfficer()) and (c.lastReadyCheck + 60) < GetTime() then
        c.lastReadyCheck = GetTime()
        self:TriggerEvent("BigWigs_SendSync", "RequestReadyCheck")
    end
end