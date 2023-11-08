#When starting the travel sequence we need to assign each player to a ship
#Well start with 4 ships because thats a reasonable amount of players for this game. anyone else can be a spectator.

#Set the main game state to match travelling
scoreboard players set @e[type=space:variables] gamestate 2


#==========================CREATE AND ASSIGN SHIPS TO PLAYERS================
#Send players to the zone
tp @a -94.13 36 59.97
#lets remove the old miniships
kill @e[type=space:miniship]
#And summon some new ones with tags as identifiers
#First see how many ships we need
function misc/countplayers
#Ship 1
execute as @e[type=space:variables,scores={activeplayers=1..}] run summon space:miniship -94.13 36 59.97
tag @e[type=space:miniship,tag=!assignednum] add ship1
tag @e[type=space:miniship] add assignednum
#ship 2
execute as @e[type=space:variables,scores={activeplayers=2..}] run summon space:miniship -94.13 36 59.97
tag @e[type=space:miniship,tag=!assignednum] add ship2
tag @e[type=space:miniship] add assignednum
#ship 3
execute as @e[type=space:variables,scores={activeplayers=3..}] run summon space:miniship -94.13 36 59.97
tag @e[type=space:miniship,tag=!assignednum] add ship3
tag @e[type=space:miniship] add assignednum
#ship 4
execute as @e[type=space:variables,scores={activeplayers=4..}] run summon space:miniship -94.13 36 59.97
tag @e[type=space:miniship,tag=!assignednum] add ship4
tag @e[type=space:miniship] add assignednum

#Now each player needs to be assigned a ship, well just delete any unused ships afterwards
#Unnasign any ships from previous travel sequences
tag @a remove hasship
tag @a remove ship1
tag @a remove ship2
tag @a remove ship3
tag @a remove ship4
tag @a remove shipspectator

#Each ship should find an owner who does not have a "hasship" tag
execute as @e[tag=ship1] run tag @p[tag=!hasship] add ship1
execute as @e[tag=ship1] run tag @p[tag=ship1] add hasship

execute as @e[tag=ship2] run tag @p[tag=!hasship] add ship2
execute as @e[tag=ship2] run tag @p[tag=ship1] add hasship

execute as @e[tag=ship3] run tag @p[tag=!hasship] add ship3
execute as @e[tag=ship3] run tag @p[tag=ship1] add hasship

execute as @e[tag=ship4] run tag @p[tag=!hasship] add ship4
execute as @e[tag=ship4] run tag @p[tag=ship1] add hasship

#Any remaining players will become spectators, so all either have "hasship" and number or"shipspectator"
tag @a[tag=!hasship] add shipspectator


#=====================================================================

#================SUMMON PLANETS AND FLOATING TEXT=======================


#Time to update the gamestateiterate variable so we know all tags are legal
function validateonlineplayers


#summon destination markers that players can fly onto to start travelling
kill @e[type=space:portal]
summon space:portal -94.13 34.75 59.97
tag @e[type=space:portal] add returnpo
tag @e[type=space:portal] add tagged


kill @e[type=space:planet]
kill @e[type=armor_stand,tag=travel]
#####Summon planet 1, the blackmarket----------------
summon space:planet -94.2 32.60 35
tag @e[type=space:planet,tag=!assigned] add blackmarketpl
tag @e[type=space:planet,tag=blackmarketpl] add assigned
#####Set its item hand to switch its visuals
replaceitem entity @e[type=space:planet,tag=blackmarketpl] slot.weapon.mainhand 0 stone_sword
#####Summon portal and hovertext
execute as @e[tag=returnpo] at @s run summon space:portal ~ ~ ~-19
tag @e[type=space:portal,tag=!tagged] add blackmarketpo
tag @e[type=space:portal] add tagged
#Text displays
execute as @e[tag=returnpo] at @s run summon armor_stand ~ ~1.5 ~-19 0 0 sas:nametag_show_t "§7Buy upgrades for your robot."
execute as @e[tag=returnpo] at @s run summon armor_stand ~ ~2 ~-19 0 0 sas:nametag_show_t "§4The Black Market"
tag @e[type=armor_stand,tag=!tagged] add travel
tag @e[type=armor_stand] add tagged

#-----------------------------------------------------

#####Summon planet 2, The Palace Arena----------------
summon space:planet -70 32.60 51
tag @e[type=space:planet,tag=!assigned] add arenapl
tag @e[type=space:planet,tag=arenapl] add assigned
#####Set its item hand to switch its visuals
replaceitem entity @e[type=space:planet,tag=arenapl] slot.weapon.mainhand 0 iron_sword
#####Summon portal and hovertext
execute as @e[tag=returnpo] at @s run summon space:portal ~19 ~ ~-7
tag @e[type=space:portal,tag=!tagged] add arenapo
tag @e[type=space:portal] add tagged
#Text displays
execute as @e[tag=returnpo] at @s run summon armor_stand ~19 ~1.5 ~-7 0 0 sas:nametag_show_t "§bYou §4VS.§d The Gladiators "
execute as @e[tag=returnpo] at @s run summon armor_stand ~19 ~2 ~-7 0 0 sas:nametag_show_t "§fPalace Arena"
tag @e[type=armor_stand,tag=!tagged] add travel
tag @e[type=armor_stand] add tagged

#-----------------------------------------------------

#####Summon planet 3, Radioactive Aliens----------------
summon space:planet -78 30.60 76
tag @e[type=space:planet,tag=!assigned] add alienpl
tag @e[type=space:planet,tag=alienpl] add assigned
#####Set its item hand to switch its visuals
replaceitem entity @e[type=space:planet,tag=alienpl] slot.weapon.mainhand 0 wooden_sword
#####Summon portal and hovertext
execute as @e[tag=returnpo] at @s run summon space:portal ~13 ~ ~12
tag @e[type=space:portal,tag=!tagged] add alienpo
tag @e[type=space:portal] add tagged
#Text displays
execute as @e[tag=returnpo] at @s run summon armor_stand ~13 ~1.5 ~12 0 0 sas:nametag_show_t "§bYou §4VS.§d Robot Slime Aliens "
execute as @e[tag=returnpo] at @s run summon armor_stand ~13 ~2 ~12 0 0 sas:nametag_show_t "§2Poison War-Ship"
tag @e[type=armor_stand,tag=!tagged] add travel
tag @e[type=armor_stand] add tagged

#-----------------------------------------------------

#####Summon planet 3, Spider land----------------
summon space:planet -111 32.6 76
tag @e[type=space:planet,tag=!assigned] add spiderspl
tag @e[type=space:planet,tag=spiderspl] add assigned
#####Set its item hand to switch its visuals
replaceitem entity @e[type=space:planet,tag=spiderspl] slot.weapon.mainhand 0 golden_sword
#####Summon portal and hovertext
execute as @e[tag=returnpo] at @s run summon space:portal ~-13 ~ ~12
tag @e[type=space:portal,tag=!tagged] add spiderspo
tag @e[type=space:portal] add tagged
#Text displays
execute as @e[tag=returnpo] at @s run summon armor_stand ~-13 ~1.5 ~12 0 0 sas:nametag_show_t "§bYou §4VS.§d The Spiderbot Swarm "
execute as @e[tag=returnpo] at @s run summon armor_stand ~-13 ~2 ~12 0 0 sas:nametag_show_t "§2Red Valley"
tag @e[type=armor_stand,tag=!tagged] add travel
tag @e[type=armor_stand] add tagged

#-----------------------------------------------------

#####Summon planet 5, Apocolyptus----------------
summon space:planet -119 32.60 51
tag @e[type=space:planet,tag=!assigned] add Apocolyptuspl
tag @e[type=space:planet,tag=Apocolyptuspl] add assigned
#####Set its item hand to switch its visuals
replaceitem entity @e[type=space:planet,tag=Apocolyptuspl] slot.weapon.mainhand 0 diamond_sword
#####Summon portal and hovertext
execute as @e[tag=returnpo] at @s run summon space:portal ~-19 ~ ~-7
tag @e[type=space:portal,tag=!tagged] add Apocolyptuspo
tag @e[type=space:portal] add tagged
#Text displays
execute as @e[tag=returnpo] at @s run summon armor_stand ~-19 ~1.5 ~-7 0 0 sas:nametag_show_t "§bYou §4VS.§d The Slasher"
execute as @e[tag=returnpo] at @s run summon armor_stand ~-19 ~2 ~-7 0 0 sas:nametag_show_t "§2Apocolyptus"
tag @e[type=armor_stand,tag=!tagged] add travel
tag @e[type=armor_stand] add tagged

#-----------------------------------------------------


#display of planets changes based on the invisibly held item
#execute @s[scores={mission=0},tag=free] ~ ~ ~ replaceitem entity @e[type=space:planet] slot.weapon.mainhand 0 stone_sword
#execute @s[scores={mission=1},tag=free] ~ ~ ~ replaceitem entity @e[type=space:planet] slot.weapon.mainhand 0 iron_sword
#execute @s[scores={mission=2},tag=free] ~ ~ ~ replaceitem entity @e[type=space:planet] slot.weapon.mainhand 0 golden_sword
#execute @s[scores={mission=4},tag=free] ~ ~ ~ replaceitem entity @e[type=space:planet] slot.weapon.mainhand 0 diamond_sword
#execute @s[scores={mission=3},tag=free] ~ ~ ~ replaceitem entity @e[type=space:planet] slot.weapon.mainhand 0 wooden_sword


#================================================================================#
