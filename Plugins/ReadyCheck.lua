--[[
    by LYQ(Virose / MOUZU)
    https://github.com/MOUZU/BigWigs
    
    This is a small plugin to make the ReadyCheck from later expansions usable.
--]]

------------------------------
--      Are you local?      --
------------------------------
local c = {
    lastReadyCheck  = 0,    -- do I still need that?
    statusList      = {
        -- this list is resetting every finished ready check
        -- it keeps track of the results from the ongoing ready check
        -- [player] = response,
    },
    initialized     = false,    -- init process(overwrite things)
    
    ackList         = {
        -- this should list the acknowledges which we received
        -- to determine who is not using a compatible version
    },
    withoutAddOn    = {
        -- this shall cache who is not using a compatible version
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
    self:ScheduleEvent("ReadyCheckSetup", BigWigsReadyCheck.SetupFrames, 2) -- does this fix the lua error?
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsReadyCheck:BigWigs_RecvSync(sync, rest, nick)
    --[[
        we consider four different scenarios:
        - a raidmember does not have this addon, he will not acknowledge the request
        - a raidmember does have it, but is not responding in time (AFK), he will acknowledge but neither confirm nor deny
        - a raidmember does have it and confirms it, he will acknowledge and confirm
        - a raidmember does have it and denies it(he is not ready but not afk), he will acknowledge and deny
    --]]
    if sync == "ReadyCheckRequest" then
        -- a RaidOfficer started a ReadyCheck, we acknowledge his request
        self:TriggerEvent("BigWigs_SendSync", "ReadyCheckAcknowledge")
        ReadyCheckFrame:Show()
        
        -- we clear the result table
        for unit=1, GetNumRaidMembers() do
            local name = GetRaidRosterInfo(unit)
            c.statusList[name] = nil
        end
        -- we clear the ack table because we want to know only the results of this current raid setup
        for i=1, table.getn(c.ackList) do
            c.ackList[i] = nil
        end
        
        -- TODO: setup OnUpdate to hide the frame after 29s again
        --          if the time runs out and the player did not respond, make a message that the player missed a readycheck
    elseif sync == "ReadyCheckAcknowledge" then
        -- another raidmember acknowledged the request
        tinsert(c.ackList, nick)
        
        -- TODO: display a question mark on his raidframe
    elseif sync == "ReadyCheckConfirm" then
        -- a raidmember confirmed the request
        c.statusList[nick] = true
        
        -- TODO: display a green check sign on his raidframe (hide the question mark)
    elseif sync == "ReadyCheckDeny" then
        -- a raidmember denied the request
        c.statusList[nick] = false
        
        -- TODO: display a red cross on his raidframe (hide the question mark)
    end
end

function BigWigsReadyCheck:SetupFrames()
    -- I'm overwriting the related Button scripts to use my sync
    if not c.initialized then
        RaidFrameReadyCheckButton:SetScript('OnClick', function()
                --DoReadyCheck()    I'll not need that anymore
                
                -- init onupdate and possibly enable readycheck for raid assistants too, need to make the button for them visible beforehand too
                -- OnUpdate for - disabling the button for 30s while the current ReadyCheck is ongoing. and analyzing the results of it.
                -- if time is up and raidmember did ack but not respond make him display as denied.
                -- how long should the results be visible after the time is up or all ack members responded? 5s? 10s?
                -- TODO: check for compatibility of Grid, sRaidFrames and LunaRaidFrames
                -- TO RETHINK: option to display AFK players in raidchat or maybe players without the addon?, these options should only be for RL
            end)
        
        ReadyCheckFrameYesButton:SetScript('OnClick', function()
                --ConfirmReadyCheck(1)  I'll not need that anymore
                ReadyCheckFrame:Hide()
                BigWigsReadyCheck:TriggerEvent("BigWigs_SendSync", "ReadyCheckConfirm")
            end)
        ReadyCheckFrameNoButton:SetScript('OnClick', function()
                --ConfirmReadyCheck()   I'll not need that anymore
                ReadyCheckFrame:Hide()
                BigWigsReadyCheck:TriggerEvent("BigWigs_SendSync", "ReadyCheckDeny")
            end)
        
        c.initialized = true
    end
end