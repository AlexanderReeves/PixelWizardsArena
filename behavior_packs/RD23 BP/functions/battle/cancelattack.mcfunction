#all wizards with an active attack cooldown will run this code to check for cancellationa via change of weapon
#that might happen prior to an attack

# check their current weapon, against the initial weapon from attackanim

#id 1 = practise_wand
#id 2 = practise_staff
# set personal weapon id based on mainhand held item
scoreboard players set @s[hasitem={item=wizard:practise_wand,location=slot.weapon.mainhand}] activeweapon 1
scoreboard players set @s[hasitem={item=wizard:practise_staff,location=slot.weapon.mainhand}] activeweapon 2

#if there is a mismatch, tag them as cancelattack
execute unless score @s initialweapon = @s activeweapon run tag @s add cancelattack
tag @s[scores={botatkcooldown=1}] remove cancelattack