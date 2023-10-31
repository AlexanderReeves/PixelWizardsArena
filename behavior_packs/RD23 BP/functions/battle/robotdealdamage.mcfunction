#The robots who have just started an attack animation will have a higher cooldown than 0
#We can use the cooldown to determine how much time has passed, and deal damage as that robot accordingly

#if the players held item changes before damage is dealt, we should keep the cooldown but cancel the attack/animation
#if there is a weapon change while a cooldown is above 0, tag them as attackcancelled

#slash weapon animation, weapon 1, the cooldown shoots to 35 when the anim starts
#Approx 5 ticks later that bot can deal damage, at cooldown 29
#execute at @e[scores={botatkcooldown=29,staffid=1}] as @s run say damage
execute at @e[tag=!cancelattack,scores={botatkcooldown=29,staffid=1}] as @s run execute as @s positioned ^ ^ ^1 run scoreboard players add @e[tag=!cancelattack,type=space:healthbar,scores={hb=1..},r=3] hb -3
execute at @e[tag=!cancelattack,scores={botatkcooldown=29,staffid=1}] as @s run execute as @s positioned ^ ^ ^1 run execute at @e[type=space:healthbar,scores={hb=1..},r=3] run particle minecraft:dragon_destroy_block


execute as @e[tag=!cancelattack,scores={botatkcooldown=29,staffid=1}] at @e[scores={botatkcooldown=29,staffid=1}] run function misc/particleflames