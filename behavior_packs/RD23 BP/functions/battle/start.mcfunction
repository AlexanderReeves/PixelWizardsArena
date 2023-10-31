#This function runs as we enter any arena that is home to a battle

#set the GAMESTATE to 4, which will mean players are at an arena.
scoreboard players set @e[type=space:variables] gamestate 4
#As the gamestate has just changed, we should validate players again
function validateonlineplayers

#SUB GAMESTATE / BATTLESTATE to 1, which means players are roaming freely on their bots, and no battle has started
scoreboard players set @e[type=space:variables] battlestate 1

#IF destination is palace, load that map here!
execute as @e[type=space:variables,scores={destinationint=2}] run function battle/palace/start
