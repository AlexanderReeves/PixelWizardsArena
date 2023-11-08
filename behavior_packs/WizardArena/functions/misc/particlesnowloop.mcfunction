#This is a do while loop


#Do the action
execute as @e[tag=snowparticles] at @s positioned ~ ~-1 ~run particle minecraft:snowflake_particle ^ ^ ^1
execute as @e[tag=snowparticles,c=1] at @e[tag=snowparticles,c=1] at @s run tp @s ~ ~ ~ ~20 ~
#Iterate up
scoreboard players add @s iterator 1
#Repeat if condition not met
execute as @e[type=space:variables,scores={iterator=0..20}] run function misc/particlesnowloop