#This is the main game code run place
#tellraw @a {"rawtext":[{"text":"§2Main is running."}]}

#==========CLOCK AND TIMER========
#Run our tick clock before all else so that we know whdn a second has passed
scoreboard players add @e[type=space:variables] ticks -1
#when we reach 0 ticks, reset to 20. 20 means its the start of a second
scoreboard players set @e[type=space:variables,scores={ticks=0}] ticks 20



#=========NEW PLAYER CHECK========
#Before any code runs, let's check for new players and handle them
execute as @a[tag=!joined] as @s run function newplayer

#=======OUT OF DATE PLAYER CHECK=====
#Before any other code runs, lets make sure that everyone assigned to a ship or bot is the most recent assignee
#This will prevent someone from getting assigned a ship, leaving, and returning with a tag that has been reassigned

execute as @a unless score @s gsiterate = @e[type=space:variables,c=1] gsiterate run function invalidplayer

#=======PLAYER INVENTORY CONSISTENCY=====
#once per second, make sure players have the correct inventory, 1 wand, 1 staff
execute as @e[type=space:variables,scores={ticks=20}] run function misc/refreshinv
#also make sure that the current wizard has the corresponding weapon to what the player has selected
function misc/setweapons

#========GAMESTATE========
#run code based on the current state of the datapack
#1= ship/lobby/hub/home
#2= traveling via miniship
#3= In the market
#4= First entering an arena
execute as @e[type=space:variables,scores={gamestate=1}] run function ship/main
execute as @e[type=space:variables,scores={gamestate=2}] run function travel/main
execute as @e[type=space:variables,scores={gamestate=3}] run function market/main
execute as @e[type=space:variables,scores={gamestate=4}] run function battle/main
#NO more gamestates should exists except for these 4. anything else should be a sub category
#You could put some code here to automatically update the gsiterate value and validate players whenever there is a change in gamestate, rather than manually in every start.mcf


