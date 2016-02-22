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
    initialized     = false,
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
    self:RegisterEvent("READY_CHECK")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsReadyCheck:BigWigs_RecvSync(sync, rest, nick)
    if sync == "ReadyCheckConfirm" then
        if not c.list[nick] then
            if rest == "ready" then

            else
                
            end
            c.list[nick] = rest
        end
    elseif sync == "ReadyCheckDeny" then
        
    end
end

function BigWigsReadyCheck:READY_CHECK()
    -- send back an acknowledge to confirm that the player has the AddOn
    self:TriggerEvent("BigWigs_SendSync", "ReadyCheckAcknowledge")
end

function BigWigsReadyCheck:SetupFrames()
    if not c.initialized then
        RaidFrameReadyCheckButton:SetScript('OnClick', function()
                DoReadyCheck()
                -- init onupdate and possibly enable readycheck for raid assistants too, need to make the button for them visible beforehand too
            end)
        
        ReadyCheckFrameYesButton:SetScript('OnClick', function()
                ConfirmReadyCheck(1)
                ReadyCheckFrame:Hide()
                BigWigsReadyCheck:TriggerEvent("BigWigs_SendSync", "ReadyCheckConfirm")
            end)
        ReadyCheckFrameNoButton:SetScript('OnClick', function()
                ConfirmReadyCheck()
                ReadyCheckFrame:Hide()
                BigWigsReadyCheck:TriggerEvent("BigWigs_SendSync", "ReadyCheckDeny")
            end)
        
        c.initialized = true
    end
end