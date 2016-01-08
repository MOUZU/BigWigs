﻿------------------------------
--      Are you local?      --
------------------------------

local myname = "Nefarian Counter" -- This can be localized manually
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local BZ = AceLibrary("Babble-Zone-2.2")

local SYNC1_ID, SYNC1_DELAY, SYNC2_ID, SYNC2_DELAY, SYNCC_ID, SYNCC_DELAY = "NefCount Sync 1", 0.25, "NefCount Sync 2", 0.25, "NefCount Sync Chromatics", 0.125
local HIDE_ID, HIDE_DELAY = "NefCount Hide", 60


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["disabletrigger"] = "Nefarian dies.",
	["hidetrigger"] = "BURN! You wretches! BURN!",
	["resettrigger"] = "Let the games begin!",

	["trigger1"] = "^([%w ]+) dies.",

	["warn1"] = "%d %ss killed.",
	["warn2"] = "%d %ss and %d %ss killed.",
	["warn3"] = "%d drakonids left - Nefarian landing soon!",

	["RED"] = "Red Drakonid",
	["GREEN"] = "Green Drakonid",
	["BLUE"] = "Blue Drakonid",
	["BRONZE"] = "Bronze Drakonid",
	["BLACK"] = "Black Drakonid",
	["CHROMATIC"] = "Chromatic Drakonid",
	["TOTAL"] = "Drakonids total",

	["Nefarian landing! %s kills counted."] = true,
	["%d %s"] = true,
	[", "] = true,
	[" and "] = true,

	-- AceConsole
	["cmd"] = "nefcount",
	["bar_cmd"] = "bar",
	["bar_name"] = "Counter Bar",
	["bar_desc"] = "Show the Drakonid counter bar",
	["sbars_cmd"] = "sbars",
	["sbars_name"] = "Separate Counter Bars",
	["sbars_desc"] = "Show a Drakonid counter bar per colour",
	["warn_cmd"] = "warn",
	["warn_name"] = "Warning Messages",
	["warn_desc"] = "Display Drakonid warning messages at 30 and 35 kills",
	["swarns_cmd"] = "swarns",
	["swarns_name"] = "Separate Warning Messages",
	["swarns_desc"] = "Display warning messages at 10 and 15 Drakonid kills per colour",
	["print_cmd"] = "print",
	["print_name"] = "Print Drakonid counts",
	["print_desc"] = "Print Drakonid counts in the chat window when Nefarian lands",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsNefCount = BigWigs:NewModule(myname, "AceConsole-2.0")
BigWigsNefCount.synctoken = myname
BigWigsNefCount.zonename = BZ["Blackwing Lair"]
BigWigsNefCount.enabletrigger = {L["RED"], L["GREEN"], L["BLUE"], L["BRONZE"], L["BLACK"], L["CHROMATIC"]}
BigWigsNefCount.toggleoptions = {"bar", "sbars", "warn", "swarns", "print"}
BigWigsNefCount.revision = tonumber(string.sub("$Rev: 17263 $", 7, -3))
BigWigsNefCount.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsNefCount:OnRegister()
	self.drakonids = {{}, {}, {}}
end

function BigWigsNefCount:OnEnable()
	-- reset counter values
	local d
	d = self.drakonids[1]
		d.kind = nil
		d.name = nil
		d.max = 19
		d.kills = 0
		d.bar = nil
		d.reported = 0
	d = self.drakonids[2]
		d.kind = nil
		d.name = nil
		d.max = 19
		d.kills = 0
		d.bar = nil
		d.reported = 0
	d = self.drakonids[3]
		d.kind = "CHROMATIC"
		d.kills = 0
	d = self.drakonids
		d.kind = "TOTAL"
		d.name = L["TOTAL"]
		d.max = 42
		d.kills = 0
		d.bar = nil
		d.reported = 0
	self.nefarian = nil

	-- combat events
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	-- synchronisation
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "Drakonids", 0)
end


----------------------------
--      UI functions      --
----------------------------

function BigWigsNefCount:UpdateBar(_d)
	local d = _d and self.drakonids[_d] or self.drakonids

	if not d.bar and (d.kills > 0) and (d.kills < d.max) then
		self:TriggerEvent("BigWigs_StartCounterBar", self, d.name, d.max, "Interface\\Icons\\Spell_Shadow_Charm")
		d.bar = 0
	end

	if (d.bar ~= nil) and (d.kills > d.bar) then
		self:TriggerEvent("BigWigs_SetCounterBar", self, d.name, d.kills)
		d.bar = d.kills
	end
end

function BigWigsNefCount:HideBar(_d)
	local d = _d and self.drakonids[_d] or self.drakonids

	self:TriggerEvent("BigWigs_StopCounterBar", self, d.name)
	d.bar = nil
end

function BigWigsNefCount:HideBars()
	self:HideBar()
	self:HideBar(1)
	self:HideBar(2)
end

function BigWigsNefCount:Warn()
	local d, d1, d2 = self.drakonids, self.drakonids[1], self.drakonids[2]

	if	self.db.profile.warn and
		(	((d.reported) < 30 and d.kills >= 30) or
			((d.reported) < 35 and d.kills >= 35)	) then
		self:TriggerEvent("BigWigs_Message", string.format(L["warn3"], d.max - d.kills), "Important", nil, "Alarm")
	elseif	self.db.profile.swarns and
			(	(d1.reported < 10 and d1.kills >= 10) or
				(d1.reported < 15 and d1.kills >= 15) or
				(d2.reported < 10 and d2.kills >= 10) or
				(d2.reported < 15 and d2.kills >= 15)		) then
		local warn
		if (d1.kills >= 15) and (d2.kills >= 15) then
			warn = "Urgent"
		elseif (d1.kills >= 10) and (d2.kills >= 10) then
			warn = "Attention"
		end

		-- display the message
		if warn then
			local message
			if not d2.kind then
				message = string.format(L["warn1"], d1.kills, d1.name)
			else
				message = string.format(L["warn2"], d1.kills, d1.name, d2.kills, d2.name)
			end
			self:TriggerEvent("BigWigs_Message", message, warn, true, "Alert")
		end
	end

	d1.reported = d1.kills
	d2.reported = d2.kills
	d.reported = d.kills
end

function BigWigsNefCount:PrintCounts()
	msg = "|cfff5f530" .. string.format(L["%d %s"], self.drakonids[3].kills, L["CHROMATIC"]) .. "|r"
	if self.drakonids[1].kind then
		msg = msg .. L[", "] .. "|cfff5f530" .. string.format(L["%d %s"], self.drakonids[1].kills, self.drakonids[1].name) .. "|r"
	end
	if self.drakonids[2].kind then
		msg = msg .. L[" and "] .. "|cfff5f530" .. string.format(L["%d %s"], self.drakonids[2].kills, self.drakonids[2].name) .. "|r"
	end

	self:Print(L["Nefarian landing! %s kills counted."], msg)
end


------------------------------
--      event handlers      --
------------------------------

function BigWigsNefCount:UpdateKills(_d, sync, sync_delay, kind, kills)
	local d = self.drakonids[_d]

	if not d.kind then
		d.kind = kind
		d.name = L[kind]
	elseif d.kind ~= kind then
		return
	end

	if kills ~= nil then
		if d.kills <= kills then
			d.kills = kills

			self:CancelScheduledEvent(sync)
		end
	else
		d.kills = d.kills + 1

		self:ScheduleEvent(sync, "BigWigs_SendSync", sync_delay, "Drakonids "..d.kind.." "..d.kills)
	end
	return true
end

function BigWigsNefCount:OnKill(kind, kills)
	if (	-- we always get chromatics - check them first
			self:UpdateKills(3, SYNCC_ID, SYNCC_DELAY, kind, kills) or
			-- now the unknown colours...
			self:UpdateKills(1, SYNC1_ID, SYNC1_DELAY, kind, kills) or
			self:UpdateKills(2, SYNC2_ID, SYNC2_DELAY, kind, kills)		) and not self.nefarian then
		-- reset the hide event
		self:ScheduleEvent(HIDE_ID, self.HideBars, HIDE_DELAY, self)

		-- update total count
		self.drakonids.kills = self.drakonids[1].kills + self.drakonids[2].kills + self.drakonids[3].kills

		-- update bars (and show warning messages)
		if self.db.profile.bar then
			self:UpdateBar()
		elseif self.drakonids.bar then
			self:HideBar()
		end
		if self.db.profile.sbars then
			self:UpdateBar(1)
			self:UpdateBar(2)
		elseif self.drakonids[1].bar then
			-- the bars have been disabled - remove them!
			self:HideBar(1)
			self:HideBar(2)
		end

		-- show warning messages
		self:Warn()
	end
end


function BigWigsNefCount:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["disabletrigger"]) then
		self.core:ToggleModuleActive(self, false)
	else
		local _, _, drakonid = string.find(msg, L["trigger1"])
		if drakonid and L:HasReverseTranslation(drakonid) then
			self:OnKill(L:GetReverseTranslation(drakonid))
		end
	end
end

function BigWigsNefCount:BigWigs_RecvSync(sync, message, nick)
	if sync == "Drakonids" then
		local _, _, kind, kills = string.find(message, "([%w]+) ([%d]+)")

		if kind and L[kind] and kills then
			self:Debug("Sync from %s: %s %s", nick, kind, kills)
			self:OnKill(kind, tonumber(kills))
		end
	end
end


function BigWigsNefCount:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["resettrigger"]) then
		self:TriggerEvent("BigWigs_RebootModule", self)

	elseif string.find(msg, L["hidetrigger"]) then
		self:HideBar()
		self:HideBar(1)
		self:HideBar(2)

		if self.db.profile.print then self:PrintCounts() end

		self.nefarian = true
	end
end
