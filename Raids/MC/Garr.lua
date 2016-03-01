------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Garr"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	firesworn_name = "Firesworn",
	triggeradddead8 = "Garr gains Enrage(.+)8",
	triggeradddead7 = "Garr gains Enrage(.+)7",
	triggeradddead6 = "Garr gains Enrage(.+)6",
	triggeradddead5 = "Garr gains Enrage(.+)5",
	triggeradddead4 = "Garr gains Enrage(.+)4",
	triggeradddead3 = "Garr gains Enrage(.+)3",
	triggeradddead2 = "Garr gains Enrage(.+)2",
	triggeradddead1 = "Garr gains Enrage.",

	addmsg1 = "1/8 Firesworns dead!",
	addmsg2 = "2/8 Firesworns dead!",
	addmsg3 = "3/8 Firesworns dead!",
	addmsg4 = "4/8 Firesworns dead!",
	addmsg5 = "5/8 Firesworns dead!",
	addmsg6 = "6/8 Firesworns dead!",
	addmsg7 = "7/8 Firesworns dead!",
	addmsg8 = "8/8 Firesworns dead!",

	cmd = "Garr",
	
	adds_cmd = "adds",
	adds_name = "Dead adds counter",
	adds_desc = "Announces dead Firesworns",
} end)

L:RegisterTranslations("deDE", function() return {
	firesworn_name = "Firesworn",
	triggeradddead1 = "Garr bekommt \'Wutanfall\'.",
	triggeradddead2 = "Garr bekommt \'Wutanfall(.+)2",
	triggeradddead3 = "Garr bekommt \'Wutanfall(.+)3",
	triggeradddead4 = "Garr bekommt \'Wutanfall(.+)4",
	triggeradddead5 = "Garr bekommt \'Wutanfall(.+)5",
	triggeradddead6 = "Garr bekommt \'Wutanfall(.+)6",
	triggeradddead7 = "Garr bekommt \'Wutanfall(.+)7",
	triggeradddead8 = "Garr bekommt \'Wutanfall(.+)8",

	addmsg1 = "1/8 Feueranbeter tot!",
	addmsg2 = "2/8 Feueranbeter tot!",
	addmsg3 = "3/8 Feueranbeter tot!",
	addmsg4 = "4/8 Feueranbeter tot!",
	addmsg5 = "5/8 Feueranbeter tot!",
	addmsg6 = "6/8 Feueranbeter tot!",
	addmsg7 = "7/8 Feueranbeter tot!",
	addmsg8 = "8/8 Feueranbeter tot!",

	cmd = "Garr",
	
	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Feueranbeter Tod",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGarr = BigWigs:NewModule(boss)
BigWigsGarr.zonename = AceLibrary("Babble-Zone-2.2")["Molten Core"]
BigWigsGarr.enabletrigger = boss
BigWigsGarr.bossSync = "Garr"
BigWigsGarr.wipemobs = { L["firesworn_name"] }
BigWigsGarr.toggleoptions = {"adds", "bosskill"}
BigWigsGarr.revision = tonumber(string.sub("$Revision: 11204 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGarr:OnEnable()
    self.started    = nil
    self.adds       = 0
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsGarr:BigWigs_RecvSync(sync, rest, nick)
    if not self.started and sync == "BossEngaged" and rest == self.bossSync then
        self:StartFight()
        self:TriggerEvent("BigWigs_StartCounterBar", self, "Firesworns dead", 8, "Interface\\Icons\\spell_nature_strengthofearthtotem02")
    elseif self.started and string.find(sync, "GarrAddDead%d") then
        local newCount = tonumber(string.sub(sync, 12))
        
        
        if self.adds < newCount then
            self.adds = newCount
            self:TriggerEvent("BigWigs_Message", L["addmsg"..newCount], "Positive")
            self:TriggerEvent("BigWigs_SetCounterBar", self, "Firesworns dead", (8 - newCount))
        end
    end
end

function BigWigsGarr:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if (string.find(msg, L["triggeradddead8"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead8")
	elseif (string.find(msg, L["triggeradddead7"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead7")
	elseif (string.find(msg, L["triggeradddead6"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead6")
	elseif (string.find(msg, L["triggeradddead5"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead5")
	elseif (string.find(msg, L["triggeradddead4"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead4")
	elseif (string.find(msg, L["triggeradddead3"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead3")
	elseif (string.find(msg, L["triggeradddead2"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead2")
	elseif (string.find(msg, L["triggeradddead1"])) then
		self:TriggerEvent("BigWigs_SendSync", "GarrAddDead1")
	end
end
