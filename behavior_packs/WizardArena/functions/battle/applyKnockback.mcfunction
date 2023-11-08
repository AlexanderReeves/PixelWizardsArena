#This code runs IN CONJUNCTION WITH A SCRIPT
#say Applying tags.
#From here, we determine (When attacking) where the attacking wizard stands compared to the entities it attacks

#From the position of our character wizard, positioned just infront, to the left, behind, right, etc,  for enemies of a particular type...
execute as @e[type=wizard:wizard] at @s positioned ~ ~ ~1 run execute as @e[type=space:robot, r=0.99] run say North
execute as @e[type=wizard:wizard] at @s positioned ~ ~ ~-1 run execute as @e[type=space:robot, r=0.99] run say South
execute as @e[type=wizard:wizard] at @s positioned ~-1 ~ ~ run execute as @e[type=space:robot, r=0.99] run say East
execute as @e[type=wizard:wizard] at @s positioned ~1 ~ ~ run execute as @e[type=space:robot, r=0.99] run say West





#For enemies on the North , add the tag north
execute as @e[type=wizard:wizard] at @s positioned ~ ~ ~0.2 run tag @e[type=space:robot, r=0.99] add north

#For enemies on the South , add the tag south
execute as @e[type=wizard:wizard] at @s positioned ~ ~ ~-0.2 run tag @e[type=space:robot, r=0.99] add south

#For enemies on the North , add the tag east
execute as @e[type=wizard:wizard] at @s positioned ~-0.2 ~ ~ run tag @e[type=space:robot, r=0.99] add east

#For enemies on the South , add the tag south
execute as @e[type=wizard:wizard] at @s positioned ~0.2 ~ ~ run tag @e[type=space:robot, r=0.99] add west


#For enemies with 2 tags, combine them into 1 tag, remove the old ones.
tag @e[tag=north,tag=east] add northeast
tag @e[tag=northeast] remove north
tag @e[tag=northeast] remove east

tag @e[tag=north,tag=west] add northwest
tag @e[tag=northwest] remove north
tag @e[tag=northwest] remove west

tag @e[tag=south,tag=east] add southeast
tag @e[tag=southeast] remove south
tag @e[tag=southeast] remove east

tag @e[tag=south,tag=east] add southwest
tag @e[tag=southwest] remove south
tag @e[tag=southwest] remove west


#This code is alright, but it's easier to trigger True North, East, south, west, than NE, NW, SE, SW
#To counteract, at this point, let's remove ou

#We now have 8 tags to determine the knockback location!

#Then the script will apply knockback in that direction and remove the tags for us!
