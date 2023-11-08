#reduces the life of anything with a deathtimer, and removes it from the game.
scoreboard players add @e[scores={deathtimer=1..}] deathtimer -1

#traps on death should increase the amount of available traps for their owner
#each wizard should have 4 traps total between theninventory and on the map
#apply this to all 4 players
execute as @e[scores={deathtimer=0},tag=wiztrap1] run scoreboard players add @a[tag=wizard1] trapamount 1
execute as @e[scores={deathtimer=0},tag=wiztrap2] run scoreboard players add @a[tag=wizard1] trapamount 1
execute as @e[scores={deathtimer=0},tag=wiztrap3] run scoreboard players add @a[tag=wizard1] trapamount 1
execute as @e[scores={deathtimer=0},tag=wiztrap4] run scoreboard players add @a[tag=wizard1] trapamount 1

#make entities invisible before removing them
effect @e[scores={deathtimer=0}] invisibility 2 1 true

#tp them and their death smoke far below 
execute as @e[scores={deathtimer=0}] run execute at @s run tp @s ~ ~-25 ~

#remove via death
kill @e[scores={deathtimer=0}]

