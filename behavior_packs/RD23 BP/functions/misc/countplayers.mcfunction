#This function checks the number of online players
#Variable stored as activeplayers
scoreboard players set @e[type=space:variables] activeplayers 0
execute as @a run scoreboard players add @e[type=space:variables] activeplayers 1