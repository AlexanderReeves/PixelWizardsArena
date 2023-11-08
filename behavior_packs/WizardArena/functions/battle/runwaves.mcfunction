#Runwaves runs all the waves of a planets battle!

#When the current active planet is 2, we are on the palace/forrest, run the waves from the palace folder
#These waves within the folders will check when a wave is complete, and switch to the next wave automatically
execute as @e[type=space:variables,scores={battlestate=1,wave=2}] run function battle/palace/wave1



#Oh and if the wavecountdown is 0 or higher, we should be counting down our 5 seconds grace before the next wave begins
execute as @e[type=space:variables,scores={wavecountdown=0..}] run scoreboard players add @s wavecountdown -1

