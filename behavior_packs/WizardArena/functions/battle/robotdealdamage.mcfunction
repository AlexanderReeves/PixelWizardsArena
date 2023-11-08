#The wizards who have a cooldown higher than 0 have attempted to deal damage

#We can use the cooldown to determine how much time has passed, and deal damage when enough time has passed since the attack started

#If there is a weapon change while there is a cooldown in progress, that means that the attack might be cancelled. In those instances, a cancel attack tag voids the code

#TAG WIZARDS WHO HAVE CHARGES AVAILABLE FOR WAND ATTACKS

execute as @a[scores={magiccharge=1..},tag=wizard1] run tag @e[tag=wiz1] add charged


#slash weapon animation, weapon 1, the cooldown shoots to 35 when the anim starts
#Approx 5 ticks later that bot can deal damage, at cooldown 29
#----------------------wizards whose attacks are not cancelled, at cooldown time 29, with their initial weapon as 1 will deal damage here


#=========DEAL DAMAGE=========
#id 1 = practise_wand DOES NOT DEAL MELEE DAMAGE
#execute at @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=charged] as @s run execute as @s positioned ^ ^ ^1 run scoreboard players add @e[tag=!cancelattack,type=space:healthbar,scores={hb=1..},r=3] hb -3
#execute at @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=charged] as @s run execute as @s positioned ^ ^ ^1 run execute at @e[type=space:healthbar,scores={hb=1..},r=3] run particle minecraft:dragon_destroy_block

#id 2 = practise_staff
#Only run in tutorial state 2
execute as @s[scores={tutorialstate=2}] run execute at @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=2}] as @s run execute as @s positioned ^ ^ ^1 run scoreboard players add @e[tag=!cancelattack,type=space:healthbar,scores={hb=1..},r=3] hb -4
execute as @s[scores={tutorialstate=2}] run execute at @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=2}] as @s run execute as @s positioned ^ ^ ^1 run execute at @e[type=space:healthbar,scores={hb=1..},r=3] run particle minecraft:dragon_destroy_block

#Hurt enemies in main game
tag @e[type=wizard:ele_nature] add enemy
execute at @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=2}] as @s run execute as @s positioned ^ ^ ^1 run execute at @e[tag=enemy,r=3] run particle minecraft:dragon_destroy_block
execute at @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=2}] as @s run execute as @s positioned ^ ^ ^1 run kill @e[tag=enemy,r=2]


#=======END DEAL DAMAGE======

#=====PARTICLE EFFECTS======
#1 wand when charged, and only in the right tutorial state
execute as @s[scores={tutorialstate=3}] run execute as @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=charged] at @e[scores={botatkcooldown=29,initialweapon=1}] run function misc/wandsnow
#2 staff regardless of charge, and only in the right tutorial state
execute as @s[scores={tutorialstate=2}] run execute as @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=2}] at @e[scores={botatkcooldown=29,initialweapon=2}] run function misc/particlesnow

#==== END PARTICLE EFFECTS=====

#Remove charges if the attack consumes them
#1 wand
execute as @s[scores={tutorialstate=3..}] run execute as @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=wiz1] run scoreboard players add @a[tag=wizard1] magiccharge -1
execute as @s[scores={tutorialstate=3..}] run execute as @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=wiz2] run scoreboard players add @a[tag=wizard2] magiccharge -1
execute as @s[scores={tutorialstate=3..}] run execute as @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=wiz3] run scoreboard players add @a[tag=wizard3] magiccharge -1
execute as @s[scores={tutorialstate=3..}] run execute as @e[tag=!cancelattack,scores={botatkcooldown=29,initialweapon=1},tag=wiz4] run scoreboard players add @a[tag=wizard4] magiccharge -1
#Don't let charges go below 0
scoreboard players set @a[scores={magiccharge=..0}] magiccharge 0


#Reflect the remaining charges in the xp bar
function battle/displaycharges

#remove charged tag
tag @e remove charged
