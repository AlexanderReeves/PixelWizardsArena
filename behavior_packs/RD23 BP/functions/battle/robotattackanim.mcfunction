#This code runs as for wizards who are moving forwards



#store the current weapon so that we can cancel the attack if the weapon changes before an attack occurs
# as wizard, with weapon, without cooldown, set a score based on held item
#id 1 = practise_wand, Uses 1 charge
#id 2 = practise_staff
scoreboard players set @e[scores={botatkcooldown=0},hasitem={item=wizard:practise_wand,location=slot.weapon.mainhand}] initialweapon 1
scoreboard players set @e[scores={botatkcooldown=0},hasitem={item=wizard:practise_staff,location=slot.weapon.mainhand}] initialweapon 2

#The attack animation occurs depending on the held weapon (Even if it gets cancelled later) 
playanimation @s[scores={botatkcooldown=0,initialweapon=1}] animation.wizard.staffhit
#Charged weapon animation still runs without charges, but no damage is dealt
playanimation @s[scores={botatkcooldown=0,initialweapon=2}] animation.wizard.staffhit

#Set a cooldown before the next attack can begin
#reset the cooldown for slash weapons. Approx 1.75 second, 35 ticks, cooldown still occurs even without charges...?
scoreboard players set @s[scores={botatkcooldown=0,initialweapon=1}] botatkcooldown 35
scoreboard players set @s[scores={botatkcooldown=0,initialweapon=2}] botatkcooldown 35

#The damage and particle effects will occur via main, running battle/dealdamage and occur at a delay based on the cooldown timer (unless cancelled)


