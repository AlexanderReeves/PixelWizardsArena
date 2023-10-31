#Pregame waiting area code runs per tick

#Start battle particle effects
particle minecraft:endrod -157.41 208 362.47
particle minecraft:endrod -139.07 208.00 362.44

#Return player to ship when on portal
execute as @a at @s run execute as @e[type=space:portal,r=1] run function ship/restart

#Start tutorial when players walk to the tutorial loader
#If the tutorial is running, we stay in battlestate 1, but tutorial state also becomes 1.
#In this case the arena must restart if the player wants to begin an actual battle
execute at @a run execute as @e[type=armor_stand,r=1.5] run function battle/palace/starttutorial

#If the tutorial is state 1 or higher, then the tutorial should be running during pregame.
execute as @e[type=space:variables,scores={tutorialstate=1..}] run function battle/palace/runtutorial





