﻿------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Anubisath Guardian"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Guardian",

	summon_cmd = "summon",
	summon_name = "Summon Alert",
	summon_desc = "Warn for summoned adds",

	plagueyou_cmd = "plagueyou",
	plagueyou_name = "Plague on you alert",
	plagueyou_desc = "Warn for plague on you",

	plagueother_cmd = "plagueother",
	plagueother_name = "Plague on others alert",
	plagueother_desc = "Warn for plague on others",

	icon_cmd = "icon",
	icon_name = "Place icon",
	icon_desc = "Place raid icon on the last plagued person (requires promoted or higher)",

	explode_cmd = "explode",
	explode_name = "Explode Alert",
	explode_desc = "Warn for incoming explosion",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for enrage",

	explodetrigger = "Anubisath Guardian gains Explode.",
	explodewarn = "Exploding!",
	enragetrigger = "Anubisath Guardian gains Enrage.",
	enragewarn = "Enraged!",
	summonguardtrigger = "Anubisath Guardian casts Summon Anubisath Swarmguard.",
	summonguardwarn = "Swarmguard Summoned",
	summonwarriortrigger = "Anubisath Guardian casts Summon Anubisath Warrior.",
	summonwarriorwarn = "Warrior Summoned",
	plaguetrigger = "^([^%s]+) ([^%s]+) afflicted by Plague%.$",
	plaguewarn = " has the Plague!",
	plaguewarnyou = "You have the Plague!",
	plagueyou = "You",
	plagueare = "are",	
} end )

L:RegisterTranslations("deDE", function() return {
	summon_name = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Besch\195\188tzer des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",

	explodetrigger = "Besch\195\188tzer des Anubisath bekommt 'Explodieren'.",
	explodewarn = "Explosion!",
	enragetrigger = "Besch\195\188tzer des Anubisath bekommt 'Wutanfall'.",
	enragewarn = "Wutanfall!",
	summonguardtrigger = "Besch\195\188tzer des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriortrigger = "Besch\195\188tzer des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	summonwarriorwarn = "Krieger beschworen!",
	plaguetrigger = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	plaguewarn = " hat die Seuche!",
	plaguewarnyou = "Du hast die Seuche!",
	plagueyou = "Ihr",
	plagueare = "seid",
} end )

L:RegisterTranslations("zhCN", function() return {
	summon_name = "召唤警报",
	summon_desc = "阿努比萨斯守卫者召唤增援时发出警报",

	plagueyou_name = "玩家瘟疫警报",
	plagueyou_desc = "你中了瘟疫时发出警报",

	plagueother_name = "队友瘟疫警报",
	plagueother_desc = "队友中了瘟疫时发出警报",

	explode_name = "爆炸警报",
	explode_desc = "阿努比萨斯守卫者即将爆炸时发出警报",

	enrage_name = "狂怒警报",
	enrage_desc = "阿努比萨斯守卫者进入狂怒状态时发出警报",

	explodetrigger = "阿努比萨斯守卫者获得了爆炸的效果。",
	explodewarn = "即将爆炸！近战躲开！",
	enragetrigger = "阿努比萨斯守卫者获得了狂怒的效果。",
	enragewarn = "进入狂怒状态！",
	summonguardtrigger = "阿努比萨斯守卫者施放了召唤阿努比萨斯虫群卫士。",
	summonguardwarn = "虫群卫士已被召唤出来",
	summonwarriortrigger = "阿努比萨斯守卫者施放了召唤阿努比萨斯战士。",
	summonwarriorwarn = "阿努比萨斯战士已被召唤出来",
	plaguetrigger = "^(.+)受(.+)了瘟疫效果的影响。$",
	plaguewarn = "受到瘟疫的影响！快躲开！",
	plaguewarnyou = "你受到瘟疫的影响！快跑开！",
	plagueyou = "你",
	plagueare = "到",
} end )

L:RegisterTranslations("zhTW", function() return {
	-- Anubisath Guardian　阿努比薩斯守衛者
	summon_name = "召喚警報",
	summon_desc = "阿努比薩斯守衛者召喚增援時發出警報",

	plagueyou_name = "玩家瘟疫警報",
	plagueyou_desc = "你中了瘟疫時發出警報",

	plagueother_name = "隊友瘟疫警報",
	plagueother_desc = "隊友中了瘟疫時發出警報",

	explode_name = "爆炸警報",
	explode_desc = "阿努比薩斯守衛者即將爆炸時發出警報",

	enrage_name = "狂怒警報",
	enrage_desc = "阿努比薩斯守衛者進入狂怒狀態時發出警報",

	explodetrigger = "阿努比薩斯守衛者獲得了爆炸的效果。",
	explodewarn = "即將爆炸！近戰躲開！",
	enragetrigger = "阿努比薩斯守衛者獲得了狂怒的效果。",
	enragewarn = "進入狂怒狀態！",
	summonguardtrigger = "阿努比薩斯守衛者施放了召喚阿努比薩斯蟲群衛士。",
	summonguardwarn = "蟲群衛士已被召喚出來！",
	summonwarriortrigger = "阿努比薩斯守衛者施放了召喚阿努比薩斯戰士。",
	summonwarriorwarn = "阿努比薩斯戰士已被召喚出來！",
	plaguetrigger = "^(.+)受到(.*)瘟疫",
	plaguewarn = "受到瘟疫的影響！快躲開！",
	plaguewarnyou = "你受到瘟疫的影響！快跑開！",
	plagueyou = "你",
	plagueare = "了",
} end )

L:RegisterTranslations("koKR", function() return {
	summon_name = "소환 경고",
	summon_desc = "추가 소환에 대한 경고",

	plagueyou_name = "자신의 역병 경고",
	plagueyou_desc = "자신의 역병에 대한 경고",

	plagueother_name = "타인의 역병 경고",
	plagueother_desc = "타인의 역병에 대한 경고",

	icon_name = "아이콘 지정",
	icon_desc = "마지막 역병에 걸린 사람에게 공격대 아이콘 지정 (승급자 이상 요구)",

	explode_name = "폭발 경고",
	explode_desc = "폭발에 대한 경고",

	enrage_name = "분노 경고",
	enrage_desc = "분노에 대한 경고",

	explodetrigger = "아누비사스 감시자|1이;가; 폭파 효과를 얻었습니다.",
	explodewarn = "폭파! 피하세요!",
	enragetrigger = "아누비사스 감시자|1이;가; 분노 효과를 얻었습니다.",
	enragewarn = "분노!",
	summonguardtrigger = "아누비사스 감시자|1이;가; 아누비사스 감시병 소환|1을;를; 시전합니다.",
	summonguardwarn = "감시병 소환",
	summonwarriortrigger = "아누비사스 감시자|1이;가; 아누비사스 전사 소환|1을;를; 시전합니다.",
	summonwarriorwarn = "전사 소환",
	plaguetrigger = "^([^|;%s]*)(.*)역병에 걸렸습니다%.$",
	plaguewarn = "님이 역병에 걸렸습니다. 피하세요!",
	plaguewarnyou = "당신은 역병에 걸렸습니다.",
	plagueyou = "",
	plagueare = "",	
} end )

L:RegisterTranslations("frFR", function() return {

	summon_name = "Alerte invocation",
	summon_desc = "Pr\195\169viens quand le gardien invoque des adds.",

	plagueyou_name = "Alerte Peste sur vous",
	plagueyou_desc = "Pr\195\169viens quand vous avez la peste.",

	plagueother_name = "Alerte Peste sur d'autres",
	plagueother_desc = "Pr\195\169viens quand d'autres joueurs ont la peste.",

	icon_name = "Placer une ic\195\180ne",
	icon_desc = "Place une ic\195\180ne de raid sur le dernier personnage qui a la peste (requiert d'\195\170tre promus ou plus).",

	explode_name = "Alerte Explosion",
	explode_desc = "Pr\195\169viens en cas d'explosion imminente.",

	enrage_name = "Alerte Enrag\195\169",
	enrage_desc = "Pr\195\169viens quand le gardien s'enrage.",

	explodetrigger = "Gardien Anubisath gagne Exploser.",
	explodewarn = "Explosion imminente !",
	enragetrigger = "Gardien Anubisath gagne Enrager.",
	enragewarn = "Enrag\195\169 !",
	summonguardtrigger = "Gardien Anubisath lance Invocation d'un Garde-essaim Anubisath.",
	summonguardwarn = "Garde-Essaim invoqu\195\169 !",
	summonwarriortrigger = "Gardien Anubisath lance Invocation d'un Guerrier Anubisath.",
	summonwarriorwarn = "Guerrier invoqu\195\169 !",
	plaguetrigger = "^([^%s]+) ([^%s]+) les effets de Peste%.$",
	plaguewarn = " a la peste !",
	plaguewarnyou = "Tu as la peste !",
	plagueyou = "Vous",
	plagueare = "subissez",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGuardians = BigWigs:NewModule(boss)
BigWigsGuardians.zonename = AceLibrary("Babble-Zone-2.2")["Ruins of Ahn'Qiraj"]
BigWigsGuardians.enabletrigger = boss
BigWigsGuardians.toggleoptions = {"summon", "explode", "enrage", -1, "plagueyou", "plagueother", "icon", "bosskill"}
BigWigsGuardians.revision = tonumber(string.sub("$Revision: 16639 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGuardians:OnEnable()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPlague")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsGuardians:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsGuardians:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if self.db.profile.explode and msg == L["explodetrigger"] then 
		self:TriggerEvent("BigWigs_Message", L["explodewarn"], "Important")
	elseif self.db.profile.enrage and msg == L["enragetrigger"] then 
		self:TriggerEvent("BigWigs_Message", L["enragewarn"], "Important")
	end
end

function BigWigsGuardians:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF( msg )
	if self.db.profile.summon and msg == L["summonguardtrigger"] then 
		self:TriggerEvent("BigWigs_Message", L["summonguardwarn"], "Attention")
	elseif self.db.profile.summon and msg == L["summonwarriortrigger"] then 
		self:TriggerEvent("BigWigs_Message", L["summonwarriorwarn"], "Attention")
	end
end

function BigWigsGuardians:CheckPlague( msg )
	local _,_, player, type = string.find(msg, L["plaguetrigger"])
	if player and type then
		if self.db.profile.plagueyou and player == L["plagueyou"] and type == L["plagueare"] then
			self:TriggerEvent("BigWigs_Message", L["plaguewarnyou"], "Personal", true)
			self:TriggerEvent("BigWigs_Message", UnitName("player") .. L["plaguewarn"], "Attention", nil, nil, true )
		elseif self.db.profile.plagueother then
			self:TriggerEvent("BigWigs_Message", player .. L["plaguewarn"], "Attention")
			self:TriggerEvent("BigWigs_SendTell", player, L["plaguewarnyou"])
		end

		if self.db.profile.icon then
			self:TriggerEvent("BigWigs_SetRaidIcon", player)
		end
	end
end

