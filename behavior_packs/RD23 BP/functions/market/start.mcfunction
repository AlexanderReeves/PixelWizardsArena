#Set the gamemode to be 3, which means browsing at the market
scoreboard players set @e[type=space:variables] gamestate 3

#This page boots up our market area and all related entitied from scratch
tp @a 245.48 106.00 186.6

#Remove previous entities and displays
kill @e[type=space:bshielddisplay]
kill @e[type=space:pushdisplay]
kill @e[type=space:portal]
kill @e[type=space:weapondisplay]
kill @e[type=space:explosivedisplay]
kill @e[type=space:merchant]

#Load the visual display entities for the shops
summon space:explosivedisplay 241 103 220
summon space:portal 237 103.5 220
summon space:bshielddisplay 268.12 106.00 172
summon space:pushdisplay 273 107 171
summon space:weapondisplay 220 107 186.1


#==================SHOP MERCHANTS INITIALISE===============
#Summons and sorts merchants with skins and models.
#The model variant will depent on the merchants held item

#Summon it, apply tags, give item
summon space:merchant 217 106 184
tag @e[type=space:merchant,tag=!tagged] add diamond
tag @e[type=space:merchant] add tagged
replaceitem entity @e[type=space:merchant,tag=diamond,c=1] slot.weapon.mainhand 0 diamond_sword 1

summon space:merchant 273 106 177
tag @e[type=space:merchant,tag=!tagged] add wooden
tag @e[type=space:merchant] add tagged
replaceitem entity @e[type=space:merchant,c=1,tag=wooden] slot.weapon.mainhand 0 wooden_sword 1

summon space:merchant 239 103 225
tag @e[type=space:merchant,tag=!tagged] add iron
tag @e[type=space:merchant] add tagged
replaceitem entity @e[type=space:merchant,c=1,tag=iron] slot.weapon.mainhand 0 iron_sword 1

#================================================

#Portal to return to the ship, as you probably want to try your upgrades
summon space:portal 252.13 106.00 184.51
tag @e[type=space:portal,tag=!tagged] add shippo
tag @e[type=space:portal] add tagged
#Text displays
summon armor_stand 252.13 107.5 184.51 0 0 sas:nametag_show_t "§7Return to your ship."
summon armor_stand 252.13 108.00 184.51 0 0 sas:nametag_show_t "§4Finished trading?"
tag @e[type=armor_stand,tag=!tagged] add travel
tag @e[type=armor_stand] add tagged