say tutorial starting

#Remove unneeded entitites from the arena
kill @e[type=armor_stand]
kill @e[type=space:portal]

#Set the tutorialstate to 1, meaning the start of the tutorial
scoreboard players set @e[type=space:variables] tutorialstate 1

title @a times 20 40 20
#Alert the players the tutorial has begun
titleraw @a subtitle {"rawtext":[{"text":"§bThe Robot Combat Tutorial has begun."}]}
titleraw @a title {"rawtext":[{"text":"§4"}]}



#Summon orbs for the player to collect
kill @e[type=space:orb]
summon space:orb -145.50 207.00 365.50
summon space:orb -151.50 207.00 365.40
summon space:orb -151.50 207.00 359.50
summon space:orb -145.50 207.00 359.50

#SUmmon a portal players can use to quit the tutorial
