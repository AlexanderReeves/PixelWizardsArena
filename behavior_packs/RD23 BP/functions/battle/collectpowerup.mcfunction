#This is where wizards near a powerup will absorb the powerup
#This is run as the golbal variable entity

#=====================MAGIC CHARGE POWERUP FOR WAND CHARGES=======================
#Lightning powerup for wand magiccharge power
#tag the wizard as charging when they are near a lightning
execute as @e[type=wizard:lightning] at @s run execute as @e[type=wizard:wizard,r=1.5] run tag @s add addmagiccharge
#Add particles and remove the powerup
execute as @e[type=wizard:wizard] at @s run execute as @e[type=wizard:lightning,r=1.5] run particle minecraft:totem_particle
execute as @e[type=wizard:wizard] at @s run execute as @e[type=wizard:lightning,r=1.5] run particle minecraft:totem_particle
execute as @e[type=wizard:wizard] at @s run execute as @e[type=wizard:lightning,r=1.5] run effect @s invisibility 2 1 true
execute as @e[type=wizard:wizard] at @s run execute as @e[type=wizard:lightning,r=1.5] run kill @s
#wizards tagged as addmagiccharge should increase the magiccharge score of their rider
execute as @e[tag=addmagiccharge,type=wizard:wizard,tag=wiz1] run scoreboard players add @a[tag=wizard1] magiccharge 4
execute as @e[tag=addmagiccharge,type=wizard:wizard,tag=wiz2] run scoreboard players add @a[tag=wizard2] magiccharge 4
execute as @e[tag=addmagiccharge,type=wizard:wizard,tag=wiz3] run scoreboard players add @a[tag=wizard3] magiccharge 4
execute as @e[tag=addmagiccharge,type=wizard:wizard,tag=wiz4] run scoreboard players add @a[tag=wizard4] magiccharge 4
#Any players with more than 10 charge should have their charge set back to 10 , as that is the maximum
scoreboard players set @a[scores={magiccharge=10..}] magiccharge 10
#Update the riders xp bar to reflect their new xp level
#set all xp bars to 0
function battle/displaycharges

#Remove the tags as they are no longer required
tag @e remove addmagiccharge

