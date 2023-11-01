#This is where projectiles will deal damage, move forward, summon particles
#This is run as global variables

#Move projectile forwards
execute as @e[type=wizard:projectile_snow] run execute at @s run tp @s ^ ^ ^0.5
execute as @e[type=wizard:projectile_snow] at @s run particle minecraft:misc_fire_vapor_particle


#Deal damage to any enemies that are in the way!   We also add a hit tag on entities on first hit, and remove it once the projectile has cleared the distance

#    AS SNOW,                                 AT SNOW LOCATION      hb score > 1 , 4 or less distance, not tagged as hit remove score
execute as @e[type=wizard:projectile_snow] at @s run scoreboard players add @e[tag=!hit,scores={hb=1..},r=4] hb -3

#Particle effect when taking damage
execute as @e[type=wizard:projectile_snow] at @s run execute at @e[tag=!hit,scores={hb=1..},r=4] run particle minecraft:dragon_destroy_block

#Tag them so they can't recieve damage
execute as @e[type=wizard:projectile_snow] at @s run tag @e[scores={hb=1..},r=4] add hit
#Yell until distance cleared
#execute as @e[tag=hit,scores={hb=1..}] run  say i am hit
#execute as @e[tag=!hit,scores={hb=1..}] run  say i am not hit
#Remove tag when distance is bigger than 8 from a projsnow
execute as @e[type=space:healthbar] at @s run execute unless entity @e[type=wizard:projectile_snow,r=8] run tag @s remove hit

#Kill projectile once it has travelled it's maximum distance
scoreboard players add @e[scores={deathtimer=1..}] deathtimer -1
kill @e[scores={deathtimer=0},type=wizard:projectile_snow]
#Kill projectile if it is in a wall
execute as @e[type=wizard:projectile_snow] run execute unless block ^ ^ ^1 air run kill @s
#Kill projectile i

