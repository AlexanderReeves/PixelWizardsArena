#runs when the variable of launchcountdown is bigger than 0

#Display the titlescreen to show we are going to launch
#Displal length time to players as clock ticks down
execute as @e[type=space:variables,scores={launchcountdown=4}] run title @a times 20 60 0

execute as @e[type=space:variables,scores={launchcountdown=4}] run title @a times 0 60 0
execute as @e[type=space:variables,scores={launchcountdown=4}] run titleraw @a subtitle {"rawtext":[{"text":"§7Launching in 3..."}]}
execute as @e[type=space:variables,scores={launchcountdown=4}] run titleraw @a title {"rawtext":[{"text":"§4"}]}

execute as @e[type=space:variables,scores={launchcountdown=3}] run titleraw @a subtitle {"rawtext":[{"text":"§7Launching in 2..."}]}
execute as @e[type=space:variables,scores={launchcountdown=3}] run titleraw @a title {"rawtext":[{"text":"§4"}]}

execute as @e[type=space:variables,scores={launchcountdown=2}] run titleraw @a subtitle {"rawtext":[{"text":"§7Launching in 1..."}]}
execute as @e[type=space:variables,scores={launchcountdown=2}] run titleraw @a title {"rawtext":[{"text":"§4"}]}

#Switch to space ship driving!
execute as @e[type=space:variables,scores={launchcountdown=1}] run function travel/start


#lower the count
scoreboard players add @e[type=space:variables,scores={launchcountdown=1..}] launchcountdown -1