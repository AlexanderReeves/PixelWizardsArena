#Particle snow while use a unique method to generate a do while loop
#Well use an armour stand as our location
#say particlesnow
summon armor_stand ^ ^1 ^1
tag @e[type=armor_stand,tag=!tagged] add snowparticles
tag @e[type=armor_stand] add tagged
#DO WHILE LOOP
scoreboard players set @e[type=space:variables] iterator 0
execute as @e[type=space:variables] run function misc/particlesnowloop
#COMPLETE LOOP
kill @e[tag=snowparticles]
