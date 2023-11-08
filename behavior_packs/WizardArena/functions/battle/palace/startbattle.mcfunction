#start the batttle#
#wave 0 = no battle
#wave 1 = cutscene
#wave 2 = wave 1
scoreboard players set @e[type=space:variables] wave 2

title @a actionbar §7Wave 2.

#summon wave 1 enemies
summon wizard:ele_nature -138.10 207.20 362.33

#remove garbage
#Remove unneeded entitites from the arena
kill @e[type=armor_stand]
kill @e[type=space:portal]