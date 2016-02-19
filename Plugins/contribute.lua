--[[
    by LYQ(Virose / MOUZU)
    https://github.com/MOUZU/BigWigs
    
    Oh, so you did find your way to this creepy place.

    In case you're really modifying my version I trust in
    your respect that you will not touch this one.

    The footage analysis and core changes took a lot of
    time I could've spent with earning money irl or ig,
    so If you really want me to keep improving and adjusting
    this AddOn for future content releases on Nostalrius
    I'd appreciate you leaving this.

    This plugin is displaying a message once per character, if the
    character is not a member of Pariah to contribute gold to
    the Author of the Nostalrius edit which is me, LYQ.

    In addition to that, this plugin will notify the player on
    unsupported content usage. What I mean by that is, if the
    player uses the first release which has only MC/ONY/BWL/ZG
    support since more content wasn't released yet and the player
    is currently going AQ or NAXX.
    OR if AQ is released but a new adjusted AQ version of
    BigWigs is not out yet, so the player will be notified
    once per login to contribute footage for analyzing purpose
    to me, LYQ - which would help the process and speed things up.
--]]

------------------------------
--      Are you local?      --
------------------------------
local listOfRaidZones   = {
    "Molten Core",
    "Onyxia's Lair",
    "Blackwing Lair",
    "Zul'Gurub",
    "Ruins of Ahn'Qiraj",
    "Ahn'Qiraj",
    "Naxxramas"
}
local unsupportedRaids  = {
    -- this is a list of unsupported raids in this version
    -- needs to be updated on future content and AddOn releases
    "Ruins of Ahn'Qiraj",
    "Ahn'Qiraj",
    "Naxxramas"
}
local footageRequest    = false
local prefix            = "|cf75DE52f[BigWigs]|r - ";

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsContribute               = BigWigs:NewModule("Contribute")
BigWigsContribute.toggleoptions = {"footage"}

------------------------------
--      Initialization      --
------------------------------

function BigWigsContribute:OnEnable()
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    
    -- this will deactivate the footage Request on unsupported content
    if not self.db.profile.footage then
        footageRequest = true
    end
end

function BigWigsContribute:ZONE_CHANGED_NEW_AREA()
    -- this will trigger the donation message once per character if not in Pariah
    if not BigWigsContributeFlag then
        for i=1, tabel.getn(listOfRaidZones) do
            local area = AceLibrary("Babble-Zone-2.2")[listOfRaidZones[i]]
            if area and area == GetRealZoneText() then
                if not GetGuildInfo("player") == "Pariah" then
                    DEFAULT_CHAT_FRAME:AddMessage(prefix .. "You are using the BigWigs version adjusted and enhanced for Nostalrius. This version was made by LYQ for <Pariah>. For continued support of future content and/or plugins you can donate Gold to the Author to LYQ(Horde) or Virose(Alliance). Thank you.")
                end
                BigWigsContributeFlag = true
            end
        end
    end
    
    -- check for unsupported raids
    if not footageRequest then
        for i=1, table.getn(unsupportedRaids) do
            local area = AceLibrary("Babble-Zone-2.2")[unsupportedRaids[i]]
            if area and area == GetRealZoneText() then
                DEFAULT_CHAT_FRAME:AddMessage(prefix .. "This content is not yet adjusted for Nostalrius. Please Check for new Updates on LYQs GitHub page(github.com/MOUZU)")
                DEFAULT_CHAT_FRAME:AddMessage("If there is no Update available you can help the process by contributing footage(eg. from twitch) to help analyzing Boss mechanics on Nostalrius.")
                DEFAULT_CHAT_FRAME:AddMessage("You can deactivate these Messages in the option menu.")
                footageRequest = true
            end
        end
    end
end