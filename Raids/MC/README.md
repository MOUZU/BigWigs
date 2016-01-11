<b><a href="https://github.com/MOUZU/BigWigs"> Return to the Overview </a></b>

<br \><br \>
# Trashmobs
- Respawn Timers(?)

# Lucifron
- <b>(QA)</b> Lucifron's Curse, changed the regular timer from 20 to 15s
- <b>(100%)</b> Impending Doom
- <b>(100%)</b> Dominate Mind, I don't think it's necessary to implement a timer for the next mc and the normal one works fine
- <b>(DG)</b> Shadow Shock, Idk idc tbh

# Magmadar
- <b>(QA)</b> Panic, changed timer from 7 to 20s for the first one and from 30 to 35 to the regular ones
- <b>(QA)</b> Frenzy, added timer for first one with 29s - the others are kinda RNG between 16-21s
- <b>(QA)</b> Lava Bomb, added timer for first one with 12s and regular ones with 10s
TODO: clean up the code

# Gehennas
- <b>(99%)</b> Gehennas' Curse, doubt it will get better. The cast ranges between 23s and 38s from my analysis
- <b>(QA)</b> Shadow Bolt, timer for the next cast and the current will no longer overlap. lowered the time for the next from 4s to 3.5s for that
- <b>(DG)</b> Rain of Fire, added timer for the first rain. every other rain of fire comes about ~9s after the last but I'm missing something to trigger that correctly

# Garr
- <b>(100%)</b> Addcount
- Magma Shckles and Antimagnetic Pulse are RNG and can not be accurately predicted from my research

# Baron Geddon
- Living Bomb
- Inferno
- Ignite Mana

# Shazzrah
- Shazzrah's Curse
- Magic Grounding
- Counterspell
- Blink

# Sulfuron Harbringer
- <b>(QA)</b> Knockback, increased the timer from 9.5 to 13.5s
- <b>(DG)</b> Flame Spear, comes every 13s but I don't yet know how to trigger - gotta check the combatlog
- <b>(TODO)</b> add big healicons

# Golemagg the Incinerator
- Magma Splash(?)
- Pyroblast(?)

# Majordomo Executus
- counters on how many mobs are dead(?)
- Spellreflect shield timer(?)
- Teleport(?)
- Blast Wave(?)

# Ragnaros
- <b>(QA)</b> Combat start, added timer 65s prior to start and added an enUS locale triggering that
- <b>(QA)</b> Knockback, increased the timer from 25s to 29s
- <b>(QA)</b> Hammer of Ragnaros (Caster Knockback), added timer with 25s
- <b>(100%)</b> Submerge/Emerge timer
- <b>(100%)</b> Addcount

<br \><br \>
##### Prefix legend
- <b>(100%)</b>  = it's working flawless
- <b>(99%)</b>   = it's working as good as it can be (from my research)
- <b>(QA)</b>    = <b>Q</b>uality <b>A</b>ssurance (need to test its modified state)
- <b>(DG)</b>    = <b>D</b>ata <b>G</b>athering (need to gather more data regarding this matter)