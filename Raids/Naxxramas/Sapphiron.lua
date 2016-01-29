------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Sapphiron"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local time
local cachedUnitId
local lastTarget

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Sapphiron",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "Deep Breath alert",
	deepbreath_desc = "Warn when Sapphiron begins to cast Deep Breath.",

	lifedrain_cmd = "lifedrain",
	lifedrain_name = "Life Drain",
	lifedrain_desc = "Warns about the Life Drain curse.",

	berserk_cmd = "berserk",
	berserk_name = "Berserk",
	berserk_desc = "Warn for berserk.",

	icebolt_cmd = "icebolt",
	icebolt_name = "Announce Ice Block",
	icebolt_desc = "Yell when you become an Ice Block.",

	berserk_bar = "Berserk",
	berserk_warn_10min = "10min to berserk!",
	berserk_warn_5min = "5min to berserk!",
	berserk_warn_rest = "%s sec to berserk!",

	engage_message = "Sapphiron engaged! Berserk in 15min!",

	lifedrain_message = "Life Drain! Possibly new one ~24sec!",
	lifedrain_warn1 = "Life Drain in 5sec!",
	lifedrain_bar = "Life Drain",

	lifedrain_trigger = "afflicted by Life Drain",
	lifedrain_trigger2 = "Life Drain was resisted by",
	icebolt_trigger = "You are afflicted by Icebolt",

	deepbreath_incoming_message = "Ice Bomb casting in ~23sec!",
	deepbreath_incoming_soon_message = "Ice Bomb casting in ~5sec!",
	deepbreath_incoming_bar = "Ice Bomb Cast",
	deepbreath_trigger = "%s takes in a deep breath...",
	deepbreath_warning = "Ice Bomb Incoming!",
	deepbreath_bar = "Ice Bomb Lands!",
	icebolt_yell = "I'm an Ice Block!",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsSapphiron = BigWigs:NewModule(boss)
BigWigsSapphiron.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsSapphiron.enabletrigger = boss
BigWigsSapphiron.bossSync = "Sapphiron"
BigWigsSapphiron.toggleoptions = { "berserk", "lifedrain", "deepbreath", "icebolt", "bosskill" }
BigWigsSapphiron.revision = tonumber(string.sub("$Revision: 17541 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsSapphiron:OnEnable()
    self.started = nil
	time = nil
	cachedUnitId = nil
	lastTarget = nil

	if self:IsEventScheduled("bwsapphtargetscanner") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
	end
	if self:IsEventScheduled("bwsapphdelayed") then
		self:CancelScheduledEvent("bwsapphdelayed")
	end

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "LifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "LifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "LifeDrain")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "SapphironLifeDrain", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "SapphironFlight", 5)
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsSapphiron:BigWigs_RecvSync(sync, rest, nick)
	if not self.started and sync == "BossEngaged" and rest == self.bossSync then
        self.started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then self:UnregisterEvent("PLAYER_REGEN_DISABLED") end
		if self:IsEventScheduled("bwsapphtargetscanner") then
			self:CancelScheduledEvent("bwsapphtargetscanner")
		end
		if self:IsEventScheduled("bwsapphdelayed") then
			self:CancelScheduledEvent("bwsapphdelayed")
		end
		if self.db.profile.berserk then
			self:TriggerEvent("BigWigs_Message", L["engage_message"], "Attention")
			self:TriggerEvent("BigWigs_StartBar", self, L["berserk_bar"], 900, "Interface\\Icons\\INV_Shield_01")
			self:ScheduleEvent("bwsapphberserk1", "BigWigs_Message", 300, L["berserk_warn_10min"], "Attention")
			self:ScheduleEvent("bwsapphberserk2", "BigWigs_Message", 600, L["berserk_warn_5min"], "Attention")
			self:ScheduleEvent("bwsapphberserk3", "BigWigs_Message", 840, string.format(L["berserk_warn_rest"], 60), "Urgent")
			self:ScheduleEvent("bwsapphberserk4", "BigWigs_Message", 870, string.format(L["berserk_warn_rest"], 30), "Important")
			self:ScheduleEvent("bwsapphberserk5", "BigWigs_Message", 890, string.format(L["berserk_warn_rest"], 10), "Important")
			self:ScheduleEvent("bwsapphberserk6", "BigWigs_Message", 895, string.format(L["berserk_warn_rest"], 5), "Important")
		end
		if self.db.profile.deepbreath then
			-- Lets start a repeated event after 5 seconds of combat so that
			-- we're sure that the entire raid is in fact in combat when we
			-- start it.
			self:ScheduleEvent("besapphdelayed", self.StartTargetScanner, 5, self)
		end
	elseif sync == "SapphironLifeDrain" and self.db.profile.lifedrain then
		self:TriggerEvent("BigWigs_Message", L["lifedrain_message"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["lifedrain_bar"], 24, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
	elseif sync == "SapphironFlight" and self.db.profile.deepbreath and self.started then
		if self:IsEventScheduled("bwsapphtargetscanner") then
			self:CancelScheduledEvent("bwsapphtargetscanner")
		end
		if self:IsEventScheduled("bwsapphdelayed") then
			self:CancelScheduledEvent("bwsapphdelayed")
		end
		self:TriggerEvent("BigWigs_Message", L["deepbreath_incoming_message"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["deepbreath_incoming_bar"], 23, "Interface\\Icons\\Spell_Arcane_PortalIronForge")
		lastTarget = nil
		cachedUnitId = nil
		self:ScheduleEvent("besapphdelayed", self.StartTargetScanner, 50, self)
	end
end

function BigWigsSapphiron:LifeDrain(msg)
	if string.find(msg, L["lifedrain_trigger"]) or string.find(msg, L["lifedrain_trigger2"]) then
		if not time or (time + 2) < GetTime() then
			self:TriggerEvent("BigWigs_SendSync", "SapphironLifeDrain")
			time = GetTime()
		end
	elseif string.find(msg, L["icebolt_trigger"]) and self.db.profile.icebolt then
		SendChatMessage(L["icebolt_yell"] ,"YELL")
	end
end

function BigWigsSapphiron:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["deepbreath_trigger"] then
		if self.db.profile.deepbreath then
			self:TriggerEvent("BigWigs_Message", L["deepbreath_warning"], "Important")
			self:TriggerEvent("BigWigs_StartBar", self, L["deepbreath_bar"], 7, "Interface\\Icons\\Spell_Frost_FrostShock")
		end
		self:TriggerEvent("BigWigs_StopBar", self, L["lifedrain_bar"])
		if self.db.profile.lifedrain then
			self:TriggerEvent("BigWigs_StartBar", self, L["lifedrain_bar"], 14, "Interface\\Icons\\Spell_Shadow_LifeDrain02")
		end
	end
end

------------------------------
--      Target Scanning     --
------------------------------

function BigWigsSapphiron:StartTargetScanner()
	if self:IsEventScheduled("bwsapphtargetscanner") or not self.started then return end

	-- Start a repeating event that scans the raid for targets every 1 second.
	self:ScheduleRepeatingEvent("bwsapphtargetscanner", self.RepeatedTargetScanner, 1, self)
end

function BigWigsSapphiron:RepeatedTargetScanner()
	if not UnitAffectingCombat("player") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
		return
	end

	if not self.started then return end
	local found = nil

	-- If we have a cached unit (which we will if we found someone with the boss
	-- as target), then check if he still has the same target
	if cachedUnitId and UnitExists(cachedUnitId) and UnitName(cachedUnitId) == boss then
		found = true
	end

	-- Check the players target
	if not found and UnitExists("target") and UnitName("target") == boss then
		cachedUnitId = "target"
		found = true
	end

	-- Loop the raid roster
	if not found then
		for i = 1, GetNumRaidMembers() do
			local unit = string.format("raid%dtarget", i)
			if UnitExists(unit) and UnitName(unit) == boss then
				cachedUnitId = unit
				found = true
				break
			end
		end
	end

	-- We've checked everything. If nothing was found, just return home.
	-- We basically shouldn't return here, because someone should always have
	-- him targetted.
	if not found then return end

	local inFlight = nil

	-- Alright, we've got a valid unitId with the boss as target, now check if
	-- the boss had a target on the last iteration or not - if he didn't, and
	-- still doesn't, then we fire the "in air" warning.
	if not UnitExists(cachedUnitId.."target") then
		-- Okay, the boss doesn't have a target.
		if not lastTarget then
			-- He didn't have a target last time either
			inFlight = true
		end
		lastTarget = nil
	else
		-- This should always be set before we hit the time when he actually
		-- loses his target, hence we can check |if not lastTarget| above.
		lastTarget = true
	end

	-- He's not flying, so we're just going to continue scanning.
	if not inFlight then return end

	-- He's in flight! (I hope)
	if self:IsEventScheduled("bwsapphtargetscanner") then
		self:CancelScheduledEvent("bwsapphtargetscanner")
	end
	self:TriggerEvent("BigWigs_SendSync", "SapphironFlight")
end


