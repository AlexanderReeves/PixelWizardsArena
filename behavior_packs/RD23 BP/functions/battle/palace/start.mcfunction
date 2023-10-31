#set up the palace arena
say palace start
#tp players to arena
tp @a -148.53 207.00 349.40 0 0

#set up one robot per each of the first 4 active players
say loading bots
function battle/loadbots

say loading text
#Set up Starting zone, Quit zone, and Tutorial zone
kill @e[type=armor_stand]
#Sumon floating text armour stands

#START BATTLE
summon armor_stand -157.41 208.50 362.47 0 0 sas:nametag_show_t "§bBEGIN YOUR FIRST ROBOT DUEL."
tag @e[type=armor_stand,tag=!tagged] add nothing
tag @e[type=armor_stand] add tagged
summon armor_stand -157.41 209.00 362.47 0 0 sas:nametag_show_t "§4BATTLE"
tag @e[type=armor_stand,tag=!tagged] add start
tag @e[type=armor_stand] add tagged

#START TUTORIAL
summon armor_stand -139.07 208.50 362.44 0 0 sas:nametag_show_t "§bLEARN THE BASICS OF ROBOT DUELING."
tag @e[type=armor_stand,tag=!tagged] add nothing
tag @e[type=armor_stand] add tagged
summon armor_stand -139.07 209.00 362.44 0 0 sas:nametag_show_t "§4TUTORIAL"
tag @e[type=armor_stand,tag=!tagged] add tutorial
tag @e[type=armor_stand] add tagged

#LEAVE ARENA
summon armor_stand -148.51 208.50 370.39 0 0 sas:nametag_show_t "§bRETURN TO THE SHIP."
tag @e[type=armor_stand,tag=!tagged] add nothing
tag @e[type=armor_stand] add tagged
summon armor_stand -148.51 209.00 370.39 0 0 sas:nametag_show_t "§4QUIT"
tag @e[type=armor_stand,tag=!tagged] add quit
tag @e[type=armor_stand] add tagged
#Portal to return to the ship
summon space:portal -148.51 207.00 370.39
tag @e[type=space:portal,tag=!tagged] add shippo
tag @e[type=space:portal] add tagged