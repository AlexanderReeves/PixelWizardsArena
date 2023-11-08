#This player has joined after the game started, and could have the wrong assigned robot or ship from a previous 
#Round of the game

#Lets unassign them from everything to avoid a clash!
say I am invalid!
#Remove all possible tags from the player related to ship flight
tag @s remove hasship
tag @s remove ship1
tag @s remove ship2
tag @s remove ship3
tag @s remove ship4
tag @s add shipspectator

#Remove all possible tags from the player related to an assigned robot

scoreboard players set @s gsiterate 0
scoreboard players operation @s gsiterate += @e[type=space:variables] gsiterate