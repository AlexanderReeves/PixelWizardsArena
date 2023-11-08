#Okay, so we need to make ALL of our robots attack depending on which direction they moved in
effect @e[type=space:botmark] invisibility 1 1 true
#Each bot summoned and was assigned a botmark when they were summoned
#the botmark updates at the end of this code to to match the matching robots exact position and rotation
#therefore, any movement to the robot from here will show as the gap between the botmarks position, and the robots new position
#e.g, if the robot it infront of the botmark, it obviousky moved forward in the last tick
#lets detect robots that moved forward and have them run attack code!

#START AN ATTACK ANIMATION!
execute as @e[type=wizard:wizard,tag=wiz1] run execute at @s positioned ^ ^ ^-1 if entity @e[type=space:botmark,r=0.99] run function battle/robotattackanim

#backwards is slightly less sensitive
#we only want to run the trap code when... wave/battle level is 1 or higher, or tutorialstate = 4
#otherwise we shouldn't have a reason to place traps
execute as @e[type=space:variables,scores={tutorialstate=4}] run execute as @e[type=wizard:wizard,tag=wiz1] run execute at @s positioned ^ ^ ^1 if entity @e[type=space:botmark,r=0.99] run function battle/robotdefend

#move the botmark back to the player
execute at @e[type=wizard:wizard,tag=wiz1] run tp @e[type=space:botmark,tag=wizard1] ~ ~ ~ ~