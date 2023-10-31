#say I am attacking as a wizard
#if a wizards's cooldown is 0, attack based on their held weapon!

#slash weapon animation, weapon 1
playanimation @s[scores={botatkcooldown=0,staffid=1}] animation.wizard.staffhit

#store the current weapon so that we can cancel the attack if the weapon changes before an attack occurs
# as wizard, with weapon, without cooldown, set a score based on held item
#id 1 = practise_wand
#id 2 = practise_staff
scoreboard players set @e[scores={botatkcooldown=0},hasitem={item=wizard:practise_wand,location=slot.weapon.mainhand}] initialweapon 1
scoreboard players set @e[scores={botatkcooldown=0},hasitem={item=wizard:practise_staff,location=slot.weapon.mainhand}] initialweapon 2



#The attack 
#particle hit when damage is successful
#deal damage to enemies in damage radius
#reset the cooldown for slash weapons. Approx 1.75 second, 35 ticks
scoreboard players set @s[scores={botatkcooldown=0,staffid=1}] botatkcooldown 35

