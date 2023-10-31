#This code runs in gamestate 4, meaning on an arena planet

#Run SUB-code based on the
# SELECTED ARENA
# AND
# BATTLESTATE (changes depending on progress at an arena)

#===PALACE LEVEL , PREGAME AND TUTORIAL(destinationint = 2, gamestate = 1)
execute as @e[type=space:variables,scores={destinationint=2,battlestate=1}] run function battle/palace/pregame
#Run the tutorial if it is active with a score of 1 or more
execute as @e[type=space:variables,scores={destinationint=2,battlestate=1,tutorialstate=1..}] run function battle/palace/runtutorial

#====RIDE WIZARD  AS PLAYER=======
#Put each player on their respective robot while at any arena, there is no freeroam on planets.
#We will only run it once per ###second, just for the sake of not overworking the system
function battle/forceride



#====ATTACK CODE====
#make all the robots perform their attacks based on their movement
function battle/robotmove
#any wizard with a cooldown should cancel any attacks if there is a weapon change during the cooldown period
execute as @e[scores={botatkcooldown=1..}] run function battle/cancelattack
#The actual damage is dealt on a delay from when the move/animation starts...
#Deal the damage here
function battle/robotdealdamage
#attack cooldowns for robots should always be reducing back to 0 meaning they can attack again
scoreboard players add @e[scores={botatkcooldown=1..}] botatkcooldown -1


#UPDATE HEALTHBARS
#update healthbars of entities
execute as @e[type=space:healthbar] run function battle/updatehealthbar
