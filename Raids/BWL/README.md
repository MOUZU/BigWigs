<b><a href="https://github.com/MOUZU/BigWigs"> Return to the Overview </a></b>

<br \><br \>
# Blackwing Lair

## Razorgore the Untamed
- <b>(100%)</b> First Wave, adjusted Bar and its Warning from 29s to 46s
- <b>(100%)</b> Control Orb
- <b>(DG)</b> Mindcontrol, is the timer correct?
- <b>(DG)</b> Polymorph, is the timer correct?
- <b>(DG)</b> Egg Counter, is it counting correctly?
- <b>(DG)</b> Conflagration, seems to be RNG
- <b>(DG)</b> Fireball Volley, seems to be RNG
- <b>(QA)</b> WarnIcon, Fireball Volley cast is announced via Fireball/Meteorstorm icon
- <b>(TO RETHINK)</b> WarnIcon, for player with conflag on? (less priority than Volley)

## Vaelastrasz the Corrupt
- <b>(100%)</b> Combat Trigger, adjusted timers from 36/26/10 to 38/28/12 AND adjusted enUS locales to trigger combat
- <b>(100%)</b> Burning Adrenaline, seems to be correct
- <b>(QA)</b> WarnIcon, Burning Adrenaline icon appears when it's on you

## Broodlord Lashlayer
- <b>(QA)</b> Blast Wave, increased the timer for the first one and its warning from 12 to 17s (CAN NOT BE 100% ACCURATE)
- <b>(DG)</b> Mortal Strike, seems to have a 26s cooldown, seems not to be a timed cast
- <b>(DG)</b> Blastwave, seems to have a 25s cooldown, seems not to be a timed cast
- <b>(QA)</b> WarnIcon, Mortal Strike icon appears if your target has Mortal Strike active AND if it's up on you

## Firemaw
- <b>(100%)</b> Flame Buffet
- <b>(100%)</b> Wing Buffet, adjusted first timer from 18 to 30s
- <b>(100%)</b> Shadow Flame, added 'Next' timer with 14s
 
## Ebonroc
- <b>(100%)</b> Shadow of Ebonroc, added first timer with 8s
- <b>(100%)</b> Shadow Flame, added 'Next' timer with 14s
- <b>(100%)</b> Wing Buffet, adjusted first timer from 18 to 29s
- <b>(QA)</b> WarnIcon, Shadow of Ebonroc icon appears when it's on you

## Flamegor
- <b>(100%)</b> Wing Buffet, adjusted first timer from 18 to 28s
- <b>(100%)</b> Shadow Flame, added 'Next' timer with 14s
- <b>(100%)</b> Frenzy, added 'Next' timer with 10s, added a second trigger since it seemed that BigWigs didn't catch it 100%
- <b>(QA)</b> WarnIcon, Tranq Icon will appear for Hunters when Frenzy is up

## Chromaggus
- <b>(100%)</b> First & Second Breath, adjusted from 60 and 30 to 58.5s and 28.5s. The timer for the following breaths shall only start upon completing cast now.
- <b>(QA)</b> Frenzy, added 'Next' timer with 15s
- <b>(QA)</b> WarnIcon, Tranq Icon will appear for Hunters when Frenzy is up

## Nefarian
- <b>(100%)</b> Nefarian Landing, added a locale and a seperate Timer 'Landing NOW!' which has 13s and on the 14th second Nefarian is already on position and the tank should be too
- <b>(99%)</b> Class call, lowered the timer from 30s to 27s
- <b>(99%)</b> Fear, increased from 23.5 to 25s. Changed the title of the casting fear from 'Possible Fear' to 'Fear NOW!'
- <b>(QA)</b> Shadow Flame, added a timer for the ones following the first one with 22s (2s casttime included)
- <b>(TODO)</b> revisit NefCount Plugin (the count is so fucked up you shouldn't even use it)
- <b>(100%)</b> WarnIcon, Fear icon appears when Nef starts casting Fear
- <b>(TO RETHINK)</b> WarnIcons for specific classcalls? Priest eg?


<br \><br \>
##### Prefix legend
- <b>(100%)</b>  = it's working flawless
- <b>(99%)</b>   = it's working as good as it can be (from my research)
- <b>(QA)</b>    = <b>Q</b>uality <b>A</b>ssurance (need to test its modified state)
- <b>(DG)</b>    = <b>D</b>ata <b>G</b>athering (need to gather more data regarding this matter)
