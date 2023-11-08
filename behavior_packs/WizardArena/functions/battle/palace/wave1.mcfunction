#This code runs when wave 1 is active

#Wave one only has one enemy, summoned in startbattle.

#When the enemy dies, wait 5 seconds and then start wave 2!
#If there are no enemies left, and the countdown is -1 or less, that means the level was active, but now should be ended.
#Start the timer countdown to end the wave
tag @e[type=space:variables] remove waveactive
#If there is an ele nature alive, it should add the waveactive tag, and the next wave should begin (Unless the countdown is above -1, which means the next one is already loading)
execute as @e[type=wizard:ele_nature] run tag @e[type=space:variables,scores={wavecountdown=-1}] add waveactive
#Start the countdown when all variables are met!
execute as @e[type=space:variables,scores={wavecountdown=..-1},tag=!waveactive] run scoreboard players set @s wavecountdown 100
#If the wavecountdown is 0, we should start the next wave.
execute as @e[type=space:variables,scores={wavecountdown=0}] run function battle/palace/startw2

#Add the waveactive tag for the next tick
tag @e[type=space:variables] add waveactive
