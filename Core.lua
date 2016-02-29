
------------------------------
--      Are you local?      --
------------------------------

local BZ = AceLibrary("Babble-Zone-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local L = AceLibrary("AceLocale-2.2"):new("BigWigs")

local surface = AceLibrary("Surface-1.0")

surface:Register("Otravi", "Interface\\AddOns\\BigWigs\\Textures\\otravi")
surface:Register("Smooth", "Interface\\AddOns\\BigWigs\\Textures\\smooth")
surface:Register("Glaze", "Interface\\AddOns\\BigWigs\\Textures\\glaze")
surface:Register("Charcoal", "Interface\\AddOns\\BigWigs\\textures\\Charcoal")
surface:Register("BantoBar", "Interface\\AddOns\\BigWigs\\textures\\default")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["%s mod enabled"] = true,
	["Target monitoring enabled"] = true,
	["Target monitoring disabled"] = true,
	["%s has been defeated"] = true,     -- "<boss> has been defeated"
	["%s have been defeated"] = true,    -- "<bosses> have been defeated"

	-- AceConsole strings
	["boss"] = true,
	["Bosses"] = true,
	["Options for boss modules."] = true,
	["Options for bosses in %s."] = true, -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = true,     -- "Options for <boss> (<revision>)"
	["plugin"] = true,
	["Plugins"] = true,
	["Options for plugins."] = true,
	["extra"] = true,
	["Extras"] = true,
	["Options for extras."] = true,
	["toggle"] = true,
	["Active"] = true,
	["Activate or deactivate this module."] = true,
	["reboot"] = true,
	["rebootall"] = true,
	["Reboot"] = true,
	["Reboot All"] = true,
	["Reboot this module."] = true,
	["debug"] = true,
	["Debugging"] = true,
	["Show debug messages."] = true,
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = true,
	["%s has requested forced reboot for the %s module."] = true,
	bosskill_cmd = "kill",
	bosskill_name = "Boss death",
	bosskill_desc = "Announce when boss is defeated",

	["Other"] = true,
	["Load"] = true,
	["Load All"] = true,
	["Load all %s modules."] = true,
	
	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "Onyxia",
	["Naxxramas"] = "Naxxramas",
	["Silithus"] = true,
	["Outdoor Raid Bosses"] = "Outdoor",
	["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
	
	--Name for exception bosses (neutrals that enable modules)
	["Vaelastrasz the Corrupt"] = true,
	["Lord Victor Nefarius"] = true,
	
} end)

L:RegisterTranslations("frFR", function() return {
	["%s mod enabled"] = "Module %s activ\195\169",
	["Target monitoring enabled"] = "Suivi des cibles activ\195\169",
	["Target monitoring disabled"] = "Suivi des cibles d\195\169sactiv\195\169",
	["%s has been defeated"] = "%s a \195\169t\195\169 vaincu",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s ont \195\169t\195\169 vaincu",    -- "<bosses> have been defeated"

	-- AceConsole strings
	-- ["boss"] = true,
	["Bosses"] = "Boss",
	["Options for boss modules."] = "Options des modules des boss.",
	["Options for bosses in %s."] = "Options des boss dans %s.", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "Options pour %s (r%s).",     -- "Options for <boss> (<revision>)"
	-- ["plugin"] = true,
	-- ["Plugins"] = true,
	["Options for plugins."] = "Options pour les plugins.",
	-- ["extra"] = true,
	-- ["Extras"] = true,
	["Options for extras."] ="Options pour les extras.",
	-- ["toggle"] = true,
	["Active"] = "Actif",
	["Activate or deactivate this module."] = "Activer ou d\195\169sactiver ce module.",
	-- ["reboot"] = true,
	["Reboot"] = "Red\195\169marrer",
	["Reboot All"] = "Red\195\169marrer tout",
	["Reboot this module."] = "Red\195\169marrer ce module.",
	-- ["debug"] = true,
	["Debugging"] = "D\195\169boguage",
	["Show debug messages."] = "Afficher les messages de d\195\169boguage.",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = "Force le module pour r\195\169initialiser pour tout le monde dans le raid.\n\n(N\195\169cessite assistant ou sup\195\169rieur).",
	["%s has requested forced reboot for the %s module."] = true,
	bosskill_name = "Mort des Boss",
	bosskill_desc = "Annoncer la mort des boss.",

	["Other"] = "Autre",
	["Load"] = "Charger",
	["Load All"] = "Tout charger",
	["Load all %s modules."] = "Charge tous les modules \"%s\".",

	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "Onyxia",
	["Naxxramas"] = "Naxxramas",
	-- ["Silithus"] = true,
	["Outdoor Raid Bosses"] = "Ext\195\169rieur",
	["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
} end)
  
L:RegisterTranslations("deDE", function() return {
	["%s mod enabled"] = "%s Modul aktiviert",
	["Target monitoring enabled"] = "Ziel\195\188berwachung aktiviert",
	["Target monitoring disabled"] = "Ziel\195\188berwachung deaktiviert",
	["%s has been defeated"] = "%s wurde besiegt",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s wurden besiegt",    -- "<bosses> have been defeated"

	-- AceConsole strings
	-- ["boss"] = true,
	["Bosses"] = "Bosse",
	["Options for boss modules."] = "Optionen f\195\188r Boss Module.",
	["Options for bosses in %s."] = "Optionen f\195\188r Bosse in %s.", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "Optionen f\195\188r %s (r%s).",     -- "Options for <boss> (<revision>)"
	-- ["plugin"] = true,
	["Plugins"] = "Plugins",
	["Options for plugins."] = "Optionen f\195\188r Plugins.",
	-- ["extra"] = true,
	["Extras"] = "Extras",
	["Options for extras."] = "Optionen f\195\188r Extras.",
	-- ["toggle"] = true,
	["Active"] = "Aktivieren",
	["Activate or deactivate this module."] = "Aktiviert oder deaktiviert dieses Modul.",
	-- ["reboot"] = true,
	["Reboot"] = "Neustarten",
	["Reboot All"] = "Alles Neustarten",
	["Reboot this module."] = "Startet dieses Modul neu.",
	-- ["debug"] = true,
	["Debugging"] = "Debugging",
	["Show debug messages."] = "Zeige Debug Nachrichten.",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = "Erzwingt das Modul f\195\188r jeden im Raid zur\195\188ckgesetzt.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
	["%s has requested forced reboot for the %s module."] = "%s hat beantragt Zwangs Neustart f\195\188r die %s-Modul.",
	-- bosskill_cmd = "kill",
	bosskill_name = "Boss besiegt",
	bosskill_desc = "Melde, wenn ein Boss besiegt wurde.",

	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "Onyxia",
	["Naxxramas"] = "Naxxramas",
	-- ["Silithus"] = true,
	["Outdoor Raid Bosses"] = "Outdoor",
	-- ["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
} end)

L:RegisterTranslations("koKR", function() return {
	["%s mod enabled"] = "%s 모듈 시작",
	["Target monitoring enabled"] = "타겟 확인 시작",
	["Target monitoring disabled"] = "타겟 확인 꺼짐",
	["%s has been defeated"] = "<%s> 물리쳤습니다.",     -- "<boss> has been defeated"
	["%s have been defeated"] = "<%s> 물리쳤습니다.",    -- "<bosses> have been defeated"

	-- AceConsole strings
	["Bosses"] = "보스들",
	["Options for boss modules."] = "보스 모듈 설정",
	["Options for bosses in %s."] = "%s 에 보스들을 위한 설정", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "%s에 대한 설정(r%s).",     -- "Options for <boss> (<revision>)"
	["Plugins"] = "플러그인들",
	["Options for plugins."] = "플러그인 설정",
	["Extras"] = "기타",
	["Options for extras."] = "기타 설정.",
	["Active"] = "활성화",
	["Activate or deactivate this module."] = "활성화 혹은 모둘 발견",
	["Reboot"] = "재시작",
	["Reboot All"] = true,
	["Reboot this module."] = "모듈 재시작",
	["Debugging"] = "디버깅",
	["Show debug messages."] = "디버그 메세지 표시",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = true,
	["%s has requested forced reboot for the %s module."] = true,
	bosskill_name = "보스 사망",
	bosskill_desc = "보스를 물리쳤을 때 알림",

	["Other"] = "외부",
	["Load"] = "불러오기",
	["Load All"] = "모두 불러오기",
	["Load all %s modules."] = "모든 %s 모듈들을 불러옵니다.",
	
	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "오닉시아",
	["Naxxramas"] = "낙스라마스",
	["Silithus"] = "실리더스",
	["Outdoor Raid Bosses"] = "야외",
	["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
} end)

L:RegisterTranslations("zhCN", function() return {
	["%s mod enabled"] = "%s模块已开启",
	["Target monitoring enabled"] = "目标监视已开启",
	["Target monitoring disabled"] = "目标监视已关闭",
	["%s has been defeated"] = "%s被击败了！",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s被击败了！",    -- "<bosses> have been defeated"

	-- AceConsole strings
	["Bosses"] = "首领",
	["boss"] = "首领",
	["Options for boss modules."] = "首领模块设置。",
	["Options for bosses in %s."] = "%s首领模块设置。", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "%s模块设置 版本(r%s).",     -- "Options for <boss> (<revision>)"
	["plugin"] = "插件",
	["Plugins"] = "插件",
	["Options for plugins."] = "插件设置。",
	["extra"] = "额外",
	["Extras"] = "额外",
	["Options for extras."] = "额外的设置",
	["toggle"] = "切换",
	["Active"] = "激活",
	["Activate or deactivate this module."] = "激活或关闭此模块。",
	["reboot"] = "重启",
	["Reboot"] = "重启",
	["Reboot All"] = true,
	["Reboot this module."] = "重启此模块",
	["debug"] = "除错",
	["Debugging"] = "除错",
	["Show debug messages."] = "显示除错信息。",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = true,
	["%s has requested forced reboot for the %s module."] = true,
	bosskill_name = "首领死亡",
	bosskill_desc = "首领死亡时提示",

	["Other"] = "其他",
	["Load"] = "载入",
	["Load All"] = "载入所有",
	["Load all %s modules."] = "载入所有%s的模块",

	bosskill_name = "首领死亡",
	bosskill_desc = "首领被击败时发出提示",

	-- AceConsole zone commands
	["Zul'Gurub"] = "祖尔格拉布",
	["Molten Core"] = "熔火之心",
	["Blackwing Lair"] = "黑翼之巢",
	["Ahn'Qiraj"] = "安其拉",
	["Ruins of Ahn'Qiraj"] = "安其拉废墟",
	["Onyxia's Lair"] = "奥妮克希亚的巢穴",
	["Naxxramas"] = "纳克萨玛斯",
	["Silithus"] = "希利苏斯",
	["Outdoor Raid Bosses"] = "野外首领",
	["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
} end)

L:RegisterTranslations("zhTW", function() return {
	["%s mod enabled"] = "%s模組已開啟",
	["Target monitoring enabled"] = "目標監視已開啟",
	["Target monitoring disabled"] = "目標監視已關閉",
	["%s has been defeated"] = "%s被擊敗了！",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s被擊敗了！",    -- "<bosses> have been defeated"

	-- AceConsole strings
	["Bosses"] = "首領",
	["boss"] = "boss",
	["Options for boss modules."] = "首領模組選項。",
	["Options for bosses in %s."] = "%s首領模組選項。", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "%s模組選項 版本(r%s).",     -- "Options for <boss> (<revision>)"
	["Extras"] = "其他",
	["Options for extras."] = "其他模組選項",
	["Plugins"] = "插件",
	["Options for plugins."] = "插件選項。",
	["toggle"] = "切換",
	["Active"] = "啟動",
	["Activate or deactivate this module."] = "開啟或關閉此模組。",
	["Reboot"] = "重啟",
	["Reboot All"] = true,
	["Reboot this module."] = "重啟此模組",
	["Debugging"] = "除錯",
	["Show debug messages."] = "顯示除錯訊息。",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = true,
	["%s has requested forced reboot for the %s module."] = true,

	bosskill_name = "首領死亡",
	bosskill_desc = "首領被擊敗時發出提示。",

	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "TAQ",
	["Ruins of Ahn'Qiraj"] = "RAQ",
	["Onyxia's Lair"] = "OL",
	["Naxxramas"] = "NAX",
	["Silithus"] = "silithus",
	["Outdoor Raid Bosses"] = "outdoor",
	["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
} end)

---------------------------------
--      Addon Declaration      --
---------------------------------

BigWigs = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDebug-2.0", "AceModuleCore-2.0", "AceConsole-2.0", "AceDB-2.0", "AceHook-2.1")
BigWigs:SetModuleMixins("AceDebug-2.0", "AceEvent-2.0", "CandyBar-2.0")
BigWigs:RegisterDB("BigWigsDB", "BigWigsDBPerChar")
BigWigs.cmdtable = {type = "group", handler = BigWigs, args = {
	[L["boss"]] = {
		type = "group",
		name = L["Bosses"],
		desc = L["Options for boss modules."],
		args = {},
		disabled = function() return not BigWigs:IsActive() end,
	},
	[L["plugin"]] = {
		type = "group",
		name = L["Plugins"],
		desc = L["Options for plugins."],
		args = {},
		disabled = function() return not BigWigs:IsActive() end,
	},
	[L["extra"]] = {
		type = "group",
		name = L["Extras"],
		desc = L["Options for extras."],
		args = {},
		disabled = function() return not BigWigs:IsActive() end,
	},
}}
BigWigs:RegisterChatCommand({"/bw", "/BigWigs"}, BigWigs.cmdtable)
BigWigs.debugFrame = ChatFrame5
BigWigs.revision = tonumber(string.sub("$Revision: 18338 $", 12, -3))

--------------------------------
--      Module Prototype      --
--------------------------------

BigWigs.modulePrototype.core = BigWigs
BigWigs.modulePrototype.debugFrame = ChatFrame5
BigWigs.modulePrototype.revision = 1 -- To be overridden by the module!


function BigWigs.modulePrototype:OnInitialize()
	-- Unconditionally register, this shouldn't happen from any other place
	-- anyway.
	self.core:RegisterModule(self.name, self)

	-- Notify observers that we have loaded.
	self:TriggerEvent("BigWigs_ModuleLoaded", self.name, self)
end


function BigWigs.modulePrototype:IsBossModule()
	return self.zonename and self.enabletrigger and true
end


function BigWigs.modulePrototype:Scan()
	local t = self.enabletrigger
	local a = self.wipemobs
	if not t then return false end
	if type(t) == "string" then t = {t} end
	if a then
		if type(a) == "string" then a = {a} end
		for k,v in pairs(a) do table.insert(t, v) end
	end

	if UnitExists("target") and UnitAffectingCombat("target") then
		local target = UnitName("target")
		for _, mob in pairs(t) do
			if target == mob then
				return true
			end
		end
	end

	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitAffectingCombat(raidUnit) then
			local target = UnitName(raidUnit)
			for _, mob in pairs(t) do
				if target == mob then
					return true
				end
			end
		end
	end
	return false
end

local yellTriggers = {} -- [i] = {yell, bossmod}
function BigWigs.modulePrototype:RegisterYellEngage(yell)
    -- Bosses with Yells as Engagetrigger should go through even when the bossmod isn't active yet.
    tinsert(yellTriggers, {yell, self})
end

function BigWigs:CHAT_MSG_MONSTER_YELL(msg)
    for i=1, table.getn(yellTriggers) do
        local yell  = yellTriggers[i][1]
        local mod   = yellTriggers[i][2]
        if string.find(msg, yell) then
            -- enable and engage
            self:EnableModule(mod:ToString())
            mod:SendEngageSync()
        end
    end
end
BigWigs:RegisterEvent("CHAT_MSG_MONSTER_YELL")

function BigWigs.modulePrototype:GetEngageSync()
	return "BossEngaged"
end

function BigWigs.modulePrototype:SendEngageSync()
    if self.bossSync then
        self:TriggerEvent("BigWigs_SendSync", "BossEngaged "..self.bossSync)
    end
end

function BigWigs.modulePrototype:StartFight()
    if self.bossSync and not self.started then
        self.started = true
        self:TriggerEvent("BigWigs_Message", self:ToString() .. " engaged!", "Positive")
        BigWigsBossRecords:StartBossfight(self)
    end
end

function BigWigs.modulePrototype:SendBosskillSync()
    if self.bossSync then
        self:TriggerEvent("BigWigs_SendSync", "Bosskill "..self.bossSync)
    end
end

function BigWigs.modulePrototype:CheckForEngage()
	local go = self:Scan()
	local running = self:IsEventScheduled(self:ToString().."_CheckStart")
	if go then
		if self.core:IsDebugging() then
			self.core:LevelDebug(1, "Scan returned true, engaging ["..self:ToString().."].")
		end
		self:CancelScheduledEvent(self:ToString().."_CheckStart")
        -- I'll leave the old sync in it and only add the new one, the old one for people with an older version - we're nice guys that's why
		self:TriggerEvent("BigWigs_SendSync", "BossEngaged "..self:ToString())
        self:SendEngageSync()
	elseif not running then
		self:ScheduleRepeatingEvent(self:ToString().."_CheckStart", self.CheckForEngage, .5, self)
	end
end

function BigWigs:CheckForBosskill(msg)
    for name, module in BigWigs:IterateModules() do
        if module:IsBossModule() and BigWigs:IsModuleActive(module) then
            if msg == string.format(UNITDIESOTHER, module:ToString()) then
                module:SendBosskillSync()
            end
        end
    end
end
BigWigs:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH","CheckForBosskill")

function BigWigs.modulePrototype:CheckForWipe()
	local running = self:IsEventScheduled(self:ToString().."_CheckWipe")
	local _, class = UnitClass("player")
	if class == "HUNTER" then
		for i = 1, 32 do
			local buff = UnitBuff("player", i)
			if buff and buff == "Interface\\Icons\\Ability_Rogue_FeignDeath" then
				if not running then
					self:ScheduleRepeatingEvent(self:ToString().."_CheckWipe", self.CheckForWipe, 1, self)
				end
				return
			end
		end
	elseif class == "ROGUE" then
		for i = 1, 32 do
			local buff = UnitBuff("player", i)
			if buff and buff == "Interface\\Icons\\Ability_Vanish" then
				if not running then
					self:ScheduleRepeatingEvent(self:ToString().."_CheckWipe", self.CheckForWipe, 1, self)
				end
				return
			end
		end
	end
	for y = 1, 16 do
		local debuff = UnitDebuff("player", y)
		if debuff then
			if buff == "Interface\\Icons\\Spell_Shadow_ShadowWordDominate" then
				if not running then
					self:ScheduleRepeatingEvent(self:ToString().."_CheckWipe", self.CheckForWipe, 1, self)
				end
			return
			end
		end
	end
	local go = self:Scan()
	if not go then
		if self.core:IsDebugging() then
			self.core:LevelDebug(1, "Rebooting module ["..self:ToString().."].")
		end
		self:TriggerEvent("BigWigs_RebootModule", self)
        if self.bossSync then
            self:TriggerEvent("BigWigs_SendSync", "BossWipe "..self.bossSync)
        end
	elseif not running then
		self:ScheduleRepeatingEvent(self:ToString().."_CheckWipe", self.CheckForWipe, 2.5, self)
	end
end

function BigWigs.modulePrototype:IsRegistered()
	return self.registered
end

------------------------------
--      KLHThreatMeter      --
------------------------------

function BigWigs:KTM_Reset()
	if IsAddOnLoaded("KLHThreatMeter") then
        if IsRaidLeader() then
            klhtm.net.clearraidthreat()
        end
    end
end
function BigWigs.modulePrototype:KTM_Reset()
    BigWigs:KTM_Reset()
end

BigWigs.masterTarget = nil;
BigWigs.forceReset = nil;
function BigWigs.modulePrototype:KTM_SetTarget(targetName, forceReset)
	if IsAddOnLoaded("KLHThreatMeter") then
        if targetName and type(targetName) == "string" and (IsRaidLeader() or IsRaidOfficer()) then
            if UnitName("target") == targetName then
                klhtm.net.sendmessage("target " .. targetName)
                if forceReset then
                    self:KTM_Reset()
                end
            else
                -- we need to delay the setting mastertarget, as KTM only allows it to work if the person
                -- calling the mastertarget sync has the unit as target
                BigWigs:RegisterEvent("PLAYER_TARGET_CHANGED")
                BigWigs.masterTarget    = targetName
                BigWigs.forceReset      = forceReset
            end
        end
    end
end

function BigWigs:KTM_ClearTarget(forceReset)
    if IsAddOnLoaded("KLHThreatMeter") and IsRaidLeader() then
        klhtm.net.clearmastertarget()
        if forceReset then
            self:KTM_Reset()
        end
    end
end
function BigWigs.modulePrototype:KTM_ClearTarget(forceReset)
	BigWigs:KTM_ClearTarget(forceReset)
end

function BigWigs:PLAYER_TARGET_CHANGED()
    if IsAddOnLoaded("KLHThreatMeter") and BigWigs.masterTarget and (IsRaidLeader() or IsRaidOfficer()) then
        if klhtm.target.targetismaster(BigWigs.masterTarget) then
            -- the masterTarget was already setup correctly
            BigWigs:UnregisterEvent("PLAYER_TARGET_CHANGED")
            BigWigs.masterTarget   	= nil
            BigWigs.forceReset		= nil
            return
        end
        
        if UnitName("target") == BigWigs.masterTarget then
       	    -- our new target is the wanted target, setup masterTarget now
            klhtm.net.sendmessage("target " .. BigWigs.masterTarget)
            if BigWigs.forceReset then
                BigWigs:KTM_Reset()
                BigWigs.forceReset = nil
            end
            BigWigs.masterTarget   = nil
            BigWigs:UnregisterEvent("PLAYER_TARGET_CHANGED")
        end
    else
        BigWigs:UnregisterEvent("PLAYER_TARGET_CHANGED")
    end
end

------------------------------
--      Initialization      --
------------------------------

function BigWigs:OnInitialize()
	if not self.version then self.version = GetAddOnMetadata("BigWigs", "Version") end
	local rev = self.revision
	for name, module in self:IterateModules() do
		rev = math.max(rev, module.revision)
	end
	self.version = (self.version or "2.0").. " |cffff8888r"..rev.."|r"
	self.loading = true
	-- Activate ourselves, or at least try to. If we were disabled during a reloadUI, OnEnable isn't called,
	-- and self.loading will never be set to something else, resulting in a BigWigs that doesn't enable.
	self:ToggleActive(true)
end


function BigWigs:OnEnable()
	if AceLibrary("AceEvent-2.0"):IsFullyInitialized() then
		self:AceEvent_FullyInitialized()
	else
		self:RegisterEvent("AceEvent_FullyInitialized")
	end
end

function BigWigs:AceEvent_FullyInitialized()
	if GetNumRaidMembers() > 0 or not self.loading then
		-- Enable all disabled modules that are not boss modules.
		for name, module in self:IterateModules() do
			if type(module.IsBossModule) ~= "function" or not module:IsBossModule() then
				self:ToggleModuleActive(module, true)
			end
		end
		
		if BigWigsLoD then
			self:CreateLoDMenu()
		end
	
		self:TriggerEvent("BigWigs_CoreEnabled")
	
		self:RegisterEvent("BigWigs_TargetSeen")
		self:RegisterEvent("BigWigs_RebootModule")
	
		self:RegisterEvent("BigWigs_RecvSync")
	else
		self:ToggleActive(false)
	end
	self.loading = nil
end


function BigWigs:OnDisable()
	-- Disable all modules
	for name, module in self:IterateModules() do
		self:ToggleModuleActive(module, false)
	end

	self:TriggerEvent("BigWigs_CoreDisabled")
end


-------------------------------
--      Module Handling      --
-------------------------------

function BigWigs:RegisterModule(name, module)
	if module:IsRegistered() then
		error(string.format("%q is already registered.", name))
		return
	end

	if module:IsBossModule() then self:ToggleModuleActive(module, false) end

	-- Set up DB
	local opts
	if module:IsBossModule() and module.toggleoptions then
		opts = {}
		for _,v in pairs(module.toggleoptions) do if v ~= -1 then opts[v] = true end end
	end

	if module.db and module.RegisterDefaults and type(module.RegisterDefaults) == "function" then
		module:RegisterDefaults("profile", opts or module.defaultDB or {})
	else
		self:RegisterDefaults(name, "profile", opts or module.defaultDB or {})
	end

	if not module.db then module.db = self:AcquireDBNamespace(name) end

	-- Set up AceConsole
	if module:IsBossModule() then
		local cons
		local revision = type(module.revision) == "number" and module.revision or -1
		local L2 = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)
		if module.toggleoptions then
			local m = module
			cons = {
				type = "group",
				name = name,
				desc = string.format(L["Options for %s (r%s)."], name, revision),
				args = {
					[L["toggle"]] = {
						type = "toggle",
						name = L["Active"],
						order = 1,
						desc = L["Activate or deactivate this module."],
						get = function() return m.core:IsModuleActive(m) end,
						set = function() m.core:ToggleModuleActive(m) end,
					},
					[L["reboot"]] = {
						type = "execute",
						name = L["Reboot"],
						order = 2,
						desc = L["Reboot this module."],
						func = function() m.core:TriggerEvent("BigWigs_RebootModule", m) end,
						hidden = function() return not m.core:IsModuleActive(m) end,
					},
					[L["rebootall"]] = {
						type = "execute",
						name = L["Reboot All"],
						desc = L["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"],
						order = 3,
						func = function() if (IsRaidLeader() or IsRaidOfficer()) then m.core:TriggerEvent("BigWigs_SendSync", "RebootModule "..tostring(module)) end end,
						hidden = function() return not m.core:IsModuleActive(m) end,
					},
					[L["debug"]] = {
						type = "toggle",
						name = L["Debugging"],
						desc = L["Show debug messages."],
						order = 4,
						get = function() return m:IsDebugging() end,
						set = function(v) m:SetDebugging(v) end,
						hidden = function() return not m:IsDebugging() and not BigWigs:IsDebugging() end,
					},
				},
			}
			local x = 10
			for _,v in pairs(module.toggleoptions) do
				local val = v
				x = x + 1
				if x == 11 and v ~= "bosskill" then
					cons.args["headerblankspotthingy"] = {
						type = "header",
						order = 4,
					}
				end
				if v == -1 then
					cons.args["blankspacer"..x] = {
						type = "header",
						order = x,
					}
				else
					local l = v == "bosskill" and L or L2
					if l:HasTranslation(v.."_validate") then
						cons.args[l[v.."_cmd"]] = {
							type = "text",
							order = v == "bosskill" and -1 or x,
							name = l[v.."_name"],
							desc = l[v.."_desc"],
							get = function() return m.db.profile[val] end,
							set = function(v) m.db.profile[val] = v end,
							validate = l[v.."_validate"],
						}
					else
						cons.args[l[v.."_cmd"]] = {
							type = "toggle",
							order = v == "bosskill" and -1 or x,
							name = l[v.."_name"],
							desc = l[v.."_desc"],
							get = function() return m.db.profile[val] end,
							set = function(v) m.db.profile[val] = v end,
						}
					end
				end
			end
		end

		if cons or module.consoleOptions then
			local zonename = type(module.zonename) == "table" and module.zonename[1] or module.zonename
			local zone = zonename
			if BZ:HasReverseTranslation(zonename) and L:HasTranslation(BZ:GetReverseTranslation(zonename)) then
				zone = L[BZ:GetReverseTranslation(zonename)]
			elseif L:HasTranslation(zonename) then
				zone = L[zonename]
			end
			if not self.cmdtable.args[L["boss"]].args[zone] then
				self.cmdtable.args[L["boss"]].args[zone] = {
					type = "group",
					name = zonename,
					desc = string.format(L["Options for bosses in %s."], zonename),
					args = {},
				}
			end
			if module.external then
				self.cmdtable.args[L["extra"]].args[L2["cmd"]] = cons or module.consoleOptions
			else
				self.cmdtable.args[L["boss"]].args[zone].args[L2["cmd"]] = cons or module.consoleOptions
			end
		end
	elseif module.consoleOptions then
		if module.external then
			self.cmdtable.args[L["extra"]].args[module.consoleCmd or name] = cons or module.consoleOptions
		else
			self.cmdtable.args[L["plugin"]].args[module.consoleCmd or name] = cons or module.consoleOptions
		end
	end

	module.registered = true
	if module.OnRegister and type(module.OnRegister) == "function" then
		module:OnRegister()
	end

	-- Set up target monitoring, in case the monitor module has already initialized
	if module.zonename and module.enabletrigger then
		self:TriggerEvent("BigWigs_RegisterForTargetting", module.zonename, module.enabletrigger)
	end
end


function BigWigs:EnableModule(module, nosync)
	local m = self:GetModule(module)
	if m and m:IsBossModule() and not self:IsModuleActive(module) then
		self:ToggleModuleActive(module, true)
		self:TriggerEvent("BigWigs_Message", string.format(L["%s mod enabled"], m:ToString() or "??"), "Core")
		if not nosync then self:TriggerEvent("BigWigs_SendSync", (m.external and "EnableExternal " or "EnableModule ") .. (m.synctoken or BB:GetReverseTranslation(module))) end
        m:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	end
end


function BigWigs:BigWigs_RebootModule(module)
	self:ToggleModuleActive(module, false)
	self:ToggleModuleActive(module, true)
end


function BigWigs:BigWigs_RecvSync(sync, module, nick)
	if sync == "EnableModule" and module then
		local name = BB:HasTranslation(module) and BB[module] or module
		if self:HasModule(name) and self:GetModule(name).zonename == GetRealZoneText() then self:EnableModule(name, true) end
	elseif sync == "EnableExternal" and module then
		local name = BB:HasTranslation(module) and BB[module] or module
		if self:HasModule(name) and self:GetModule(name).zonename == GetRealZoneText() then self:EnableModule(name, true) end
	elseif sync == "RebootModule" and module then
		if nick ~= UnitName("player") then
			self:Print(string.format(L["%s has requested forced reboot for the %s module."], nick, module))
		end
		self:TriggerEvent("BigWigs_RebootModule", module)
    elseif sync == "Bosskill" and module then
        for name, mod in BigWigs:IterateModules() do
            if mod:IsBossModule() and BigWigs:IsModuleActive(mod) and mod.bossSync and mod.bossSync == module then
                if module == "High Priest Thekal" and BigWigsThekal.phase < 2 then
                    -- thekal is an exception
                    self:ScheduleEvent("ThekalPhase2", BigWigsThekal.PhaseSwitch, 1)
                else
                    BigWigsBossRecords:EndBossfight(mod)
                    BigWigsAutoReply:EndBossfight()
                    self:ToggleModuleActive(mod, false)
                    self:TriggerEvent("BigWigs_Message", string.format(L["%s has been defeated"], mod:ToString()), "Bosskill", nil, "Victory")
                end
            end
        end
        self:TriggerEvent("BigWigs_RemoveRaidIcon")
        self:TriggerEvent("BigWigs_HideIcon", "", true)
        self:KTM_ClearTarget()
	end
end


function BigWigs:BigWigs_TargetSeen(mobname, unit)
	for name,module in self:IterateModules() do
		if module:IsBossModule() and self:ZoneIsTrigger(module, GetRealZoneText()) and self:MobIsTrigger(module, mobname) and (not module.VerifyEnable or module:VerifyEnable(unit)) then
			self:EnableModule(name)
            if UnitExists(unit.."target") then
                -- if this is true the boss is apparantely already in combat!
                -- this situation can happen on bosses which spawn the same time they enter combat (Arlokk/Mandokir) or when a player without BigWigs engages the boss
                module:SendEngageSync()
            end
		end
	end
end


function BigWigs:ZoneIsTrigger(module, zone)
	local t = module.zonename
	if type(t) == "string" then return zone == t
	elseif type(t) == "table" then
		for _,mzone in pairs(t) do if mzone == zone then return true end end
	end
end


function BigWigs:MobIsTrigger(module, name)
	local t = module.enabletrigger
	if type(t) == "string" then
		return name == t
	elseif type(t) == "table" then
		for _,mob in pairs(t) do
			if mob == name then
				return true
			end
		end
	end
end


function BigWigs:CreateLoDMenu()
	local zonelist = BigWigsLoD:GetZones()
	for k,v in pairs( zonelist ) do
		if type(v) ~= "table" then
			self:AddLoDMenu( k )
		else
			self:AddLoDMenu( L["Other"] )
		end
	end
end


function BigWigs:AddLoDMenu( zonename )
	local zone = nil
	if L:HasTranslation(zonename) then
		zone = L[zonename]
	else
		zone = L["Other"]
	end
	if zone then
		if not self.cmdtable.args[L["boss"]].args[zone] then
			self.cmdtable.args[L["boss"]].args[zone] = {
				type = "group",
				name = zonename,
				desc = string.format(L["Options for bosses in %s."], zonename),
				args = {}
			}
		end
		-- if zone == L["Other"] then
			-- local zones = BigWigsLoD:GetZones()
			-- zones = zones[L["Other"]]
			-- self.cmdtable.args[L["boss"]].args[zone].args[L["Load"]] = {
				-- type = "execute",
				-- name = L["Load All"],
				-- desc = string.format( L["Load all %s modules."], zonename ),
				-- order = 1,
				-- func = function()
						-- for z, v in pairs( zones ) do
							-- BigWigsLoD:LoadZone( z )
							-- if self.cmdtable.args[L["boss"]].args[z] and self.cmdtable.args[L["boss"]].args[z].args[L["Load"]] then
								-- self.cmdtable.args[L["boss"]].args[z].args[L["Load"]] = nil
							-- end
						-- end
						-- self.cmdtable.args[L["boss"]].args[zone] = nil
					-- end
			-- }
		-- else
			-- self.cmdtable.args[L["boss"]].args[zone].args[L["Load"]] = {
				-- type = "execute",
				-- name = L["Load All"],
				-- desc = string.format( L["Load all %s modules."], zonename ),
				-- order = 1,
				-- func = function()
						-- BigWigsLoD:LoadZone( zonename )
						-- self.cmdtable.args[L["boss"]].args[zone].args[L["Load"]] = nil
					-- end
			-- }
		-- end
	end
end
