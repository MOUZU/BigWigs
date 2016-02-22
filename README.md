# BigWigs
BigWigs is a World of Warcraft AddOn to predict certain AI behaviour to improve the players performance.<br \>
This Modification is build for Patch 1.12.1 and its content for use on the <b>NostalriusBegins</b> private Server.

The adjustments were made by LYQ and for the <b>Pariah</b> Guild initially.<br \>
<b><a href="github.com/MOUZU/BigWigs">Please refer to this repository for more information.</a></b>

# Download
<b><a href="https://github.com/MOUZU/BigWigs/releases">Download the latest Release here</a></b>

## How to install
<b>a)</b> If you choose to download the .rar file all you have to do is extract the archive in your /World of Warcraft/Interface/AddOns/ directory.<br />
<b>b)</b> If you download the raw code from GitHub you'll have to unzip the downloaded archive and rename the folder from 'BigWigs-master' to 'BigWigs' and place it in your /World of Warcraft/Interface/AddOns/ directory.

## Wiki
<b><a href="https://github.com/MOUZU/BigWigs/wiki">For more information or help please visit the Wiki</a></b>

## Included AddOns
I've included several other BigWigs AddOns in this repository, so you only need to download and use the 'BigWigs' folder from this repository. If you happen to have any of the listed AddOns seperately I suggest removing them - in case I adjusted some of those in this repository as well.
<ul>
    <li><b>BigWigs_CommonAuras</b> <br \>  ( keeps track of certain Buffs eg. Fear Ward and Tank cooldowns )</li>
    <li><b>BigWigs_NefCount</b> <i>deactivated for now, needs rework</i> <br \>  ( improved mechanism for Nefarian phase 1, keeps track of the Adds killed since that triggers phase 2 )
    <li><b>BigWigs_ZombieFood</b> <i>modified</i> <br>  ( announces if a player is getting dazed )</li>
    <li><b>BigWigs_LoathebTactical</b> <br>  ( Spore and Consumable warnings for Loatheb )</li>
    <li><b>BigWigs_RespawnTimers</b> <br>  ( Trash respawn timers )</li>
    <li><b>WarnIcon</b>  <i>own development</i> <br> ( Displays important SpellIcons in the center of your screen. Eg. if you're standing in Rain of Fire at Gehennas or if you're a Hunter and Magmadar/Flamegor/Chromaggus is Frenzied and you need to Tranq )</li>
    <li><b>BossRecords</b>  <i>own development</i> <br> ( This Plugin will keep record of your time used in bossfights and compare it to your fastest )</li>
    <li><b>KLHThreatMeter compatibility</b>  <i>own development</i> <br> ( I enhanced the core so that bossmods are able to either reset the aggro list and/or set the mastertarget of KTM. A RaidOfficer needs to have this BigWigs so that it works properly. ) </li>
</ul>

## Raid Adjustments
If you want to browse through all the changes and their status regarding each encounter in the Raid specific README files. On there you can also see whether changes are untested, working perfectly or working as good as they can be.
<ul>
    <li><a href="Raids/MC/"><b>(MC)</b> Molten Core</a></li>
    <li><a href="Raids/Onyxia/"><b>(ONY)</b> Onyxia</a></li>
    <li><a href="Raids/BWL/"><b>(BWL)</b> Blackwing Lair</a></li>
    <li><a href="Raids/ZG/"><b>(ZG)</b> Zul'Gurub</a></li>
    <li><a href="Raids/AQ20/"><b>(AQ20)</b> Ruins of Ahn'Qiraj</a></li>
    <li><a href="Raids/AQ40/"><b>(AQ40)</b> Temple of Ahn'Qiraj</a></li>
    <li><a href="Raids/Naxxramas/"><b>(NAXX)</b> Naxxramas</a></li>
</ul>


## Core/General Adjustments
- <b>(100%)</b> Engage Syncs are now working perfectly on every encounter and do allow communication between clients of different language packs.
- <b>(100%)</b> Bosskill Syncs were added for every encounter dynamically and do also support communication of different language packs.
- <b>()</b> to be completed later..
