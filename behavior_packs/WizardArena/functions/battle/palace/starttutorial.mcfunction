#Remove unneeded entitites from the arena
kill @e[type=armor_stand]
kill @e[type=space:portal]

#Set the tutorialstate to 1, meaning the start of the tutorial
scoreboard players set @e[type=space:variables] tutorialstate 1

title @a times 20 40 20
#Alert the players the tutorial has begun
titleraw @a subtitle {"rawtext":[{"text":"§bThe Magic Combat Tutorial has begun."}]}
titleraw @a title {"rawtext":[{"text":"§4"}]}



#Summon orbs for the player to collect
kill @e[type=space:orb]
summon space:orb -145.50 207.00 365.50
summon space:orb -151.50 207.00 365.40
summon space:orb -151.50 207.00 359.50
summon space:orb -145.50 207.00 359.50

#SUmmon a portal players can use to quit the tutorial
summon armor_stand -148.54 207.20 371.26 0 0 sas:nametag_show_t "§bEnd tutorial."
tag @e[type=armor_stand,tag=!tagged] add nothing
tag @e[type=armor_stand] add tagged
#Portal to return to the ship
summon space:portal -148.54 207.20 371.26
tag @e[type=space:portal,tag=!tagged] add restartpalace
tag @e[type=space:portal] add tagged

#Wizard Wally message
 tellraw @a {"rawtext":[{"text":"§fWizard Wally: §dGood thinking. Let's practise. You can walk using your keyboard, touch screen, or remote control. Look over at the orbs, and walk into them to collect them."}]}
