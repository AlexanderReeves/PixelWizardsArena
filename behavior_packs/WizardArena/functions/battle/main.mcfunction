#This code runs in gamestate 4, meaning on an arena planet

#Run SUB-code based on the
# SELECTED ARENA
# AND
# BATTLESTATE (changes depending on progress at an arena)

#===PALACE LEVEL , PREGAME AND TUTORIAL(destinationint = 2, battlestate = 1)
execute as @e[type=space:variables,scores={destinationint=2,battlestate=1}] run function battle/palace/pregame
#Run the tutorial if it is active with a score of 1 or more
execute as @e[type=space:variables,scores={destinationint=2,battlestate=1,tutorialstate=1..}] run function battle/palace/runtutorial
#Run the waves if the wave is 1 or higher (Note the offset of scoreboard wave 1 being for cutscenes, and wave 2 being for the first level)
execute as @e[type=space:variables,scores={battlestate=1,wave=1..}] run function battle/runwaves

#====RIDE WIZARD  AS PLAYER=======
#Put each player on their respective robot while at any arena, there is no freeroam on planets.
#We will only run it once per ###second, just for the sake of not overworking the system
function battle/forceride

#====ALLOW WIZARDS TO COLLECT POWERUPS====
function battle/collectpowerup


#====ATTACK CODE====
#make all the robots perform their attacks based on their movement
function battle/robotmove
#any wizard with a cooldown should cancel any attacks if there is a weapon change during the cooldown period
execute as @e[scores={botatkcooldown=1..}] run function battle/cancelattack
#The actual damage is dealt on a delay from when the move/animation starts...
#Deal the damage here
function battle/robotdealdamage
#Also projectiles need to deal damage as they shoot across the world
function battle/projectiledamage
#attack cooldowns for robots should always be reducing back to 0 meaning they can attack again
scoreboard players add @e[scores={botatkcooldown=1..}] botatkcooldown -1
scoreboard players add @e[scores={trapcooldown=1..}] trapcooldown -1
#have traps deal damage
execute as @e[type=wizard:pull] run function battle/trapdamage


#UPDATE HEALTHBARS
#update healthbars of entities
execute as @e[type=space:healthbar] run function battle/updatehealthbar

#remove exipred entities
function battle/deathtimer