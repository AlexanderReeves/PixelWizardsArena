#When a new player joins, lets set them up appropriately
tellraw @a {"rawtext":[{"text":"§3A new player has joined."}]}

#Welcome message for the new player
titleraw @s subtitle {"rawtext":[{"text":"§7The ultimate space robot fighting game."}]}
titleraw @s title {"rawtext":[{"text":"§4Welcome to Robot Duels."}]}

#Tp the new player to the ship
tp @s -38.34 203.00 -34.28

#assign every player a unique identification number
scoreboard players operation @s playerid = @e[type=space:variables] iditeration
scoreboard players add @e[type=space:variables] iditeration 1

#Every player needs to be updated to the current game state iteration to make sure they are valid and didnt join late
scoreboard players set @s gsiteration 0
scoreboard players operation @s gsiterate += @e[type=space:variables] gsiterate

#every players default wand and staff should be the practise gear with an id of 1
scoreboard players set @s wandid 1
scoreboard players set @s staffid 1

#set the players magic charge to 0, charge is used for wand attacks
scoreboard players set @s magiccharge 0

tag @a add joined