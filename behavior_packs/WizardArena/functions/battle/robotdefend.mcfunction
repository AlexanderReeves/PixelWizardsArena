#This is run by wizards moving backwards

#Sequence
#  For wizards with a trap equiped
# 1. play animation
# 2. drop item
# 3. reduce score and inventory amount
# 4. refresh inventories
# 5. set a cooldown

#1.if wizard has no cooldown, and has a trap equiped, play the trap drop animation
playanimation @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand}] animation.wizard.placetrap

#2 place the item/entity into the world, tag it as owned by wiz1
execute as @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand}] at @s run summon wizard:pull ~ ~0.5 ~
#add a death timer to the trap
scoreboard players set @e[type=wizard:pull,tag=!tagged] deathtimer 300

#Tag it to match the tag of the wizard who dropped it...
#wiz1
execute as @s[tag=wiz1] run tag @e[type=wizard:pull,tag=!tagged] add wiztrap1
execute as @s[tag=wiz1] run tag @e[type=wizard:pull,tag=!tagged] add tagged
#wiz2
execute as @s[tag=wiz2] run tag @e[type=wizard:pull,tag=!tagged] add wiztrap2
execute as @s[tag=wiz2] run tag @e[type=wizard:pull,tag=!tagged] add tagged
#wiz3
execute as @s[tag=wiz3] run tag @e[type=wizard:pull,tag=!tagged] add wiztrap3
execute as @s[tag=wiz3] run tag @e[type=wizard:pull,tag=!tagged] add tagged
#wiz4
execute as @s[tag=wiz4] run tag @e[type=wizard:pull,tag=!tagged] add wiztrap4
execute as @s[tag=wiz4] run tag @e[type=wizard:pull,tag=!tagged] add tagged

#3 reduce score/amount of traps that associated player has
#Wiz 1
execute as @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand},tag=wiz1] run scoreboard players add @a[tag=wizard1] trapamount -1
#Wiz 2
execute as @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand},tag=wiz2] run scoreboard players add @a[tag=wizard2] trapamount -1
#Wiz 3
execute as @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand},tag=wiz3] run scoreboard players add @a[tag=wizard3] trapamount -1
#Wiz 4
execute as @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand},tag=wiz4] run scoreboard players add @a[tag=wizard4] trapamount -1

#refresh inventories, the held item of the wizard should be automatic in theory

execute as @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand}] run function misc/refreshinv

#5 set the cooldown of trap placing
scoreboard players set @s[scores={trapcooldown=0},hasitem={item=wizard:pull_trap,location=slot.weapon.mainhand}] trapcooldown 80