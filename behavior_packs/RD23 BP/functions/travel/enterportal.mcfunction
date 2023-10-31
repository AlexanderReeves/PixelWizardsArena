#Load a map if a player rides their ship to a planet porTAL
#First by default, assume no players fly near a portal
tag @e[type=space:variables] remove loadingplanet
scoreboard players set @e[type=space:variables] destinationint 0


execute at @e[type=space:miniship] run execute if entity @e[type=space:portal,r=2.5,tag=blackmarketpo] run scoreboard players set @e[type=space:variables] destinationint 1
execute at @e[type=space:miniship] run execute if entity @e[type=space:portal,tag=arenapo,r=2.5] run scoreboard players set @e[type=space:variables] destinationint 2
execute at @e[type=space:miniship] run execute if entity @e[type=space:portal,tag=alienpo,r=2.5] run scoreboard players set @e[type=space:variables] destinationint 3
execute at @e[type=space:miniship] run execute if entity @e[type=space:portal,tag=spiderspo,r=2.5] run scoreboard players set @e[type=space:variables] destinationint 4
execute at @e[type=space:miniship] run execute if entity @e[type=space:portal,tag=Apocolyptuspo,r=2.5] run scoreboard players set @e[type=space:variables] destinationint 5

tag @e[type=space:variables,scores={destinationint=1..}] add loadingplanet

scoreboard players add @e[type=space:variables,tag=!loadingplanet,scores={levelloading=1..}] levelloading -1
scoreboard players add @e[type=space:variables,tag=loadingplanet,scores={levelloading=..37}] levelloading 1

#Show loading bar based on how long the player has been at t a portal
execute as @e[type=space:variables,scores={levelloading=1}] run title @a actionbar §7Loading[§r§2§r§4|||||||||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=3}] run title @a actionbar §7Loading[§r§2|§r§4||||||||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=5}] run title @a actionbar §7Loading[§r§2||§r§4|||||||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=7}] run title @a actionbar §7Loading[§r§2|||§r§4||||||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=9}] run title @a actionbar §7Loading[§r§2||||§r§4|||||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=12}] run title @a actionbar §7Loading[§r§2|||||§r§4||||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=13}] run title @a actionbar §7Loading[§r§2||||||§r§4|||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=15}] run title @a actionbar §7Loading[§r§2|||||||§r§4||||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=17}] run title @a actionbar §7Loading[§r§2||||||||§r§4|||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=19}] run title @a actionbar §7Loading[§r§2|||||||||§r§4||||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=21}] run title @a actionbar §7Loading[§r§2||||||||||§r§4|||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=23}] run title @a actionbar §7Loading[§r§2|||||||||||§r§4||||||§r§7]
execute as @e[type=space:variables,scores={levelloading=25}] run title @a actionbar §7Loading[§r§2||||||||||||§r§4|||||§r§7]
execute as @e[type=space:variables,scores={levelloading=27}] run title @a actionbar §7Loading[§r§2|||||||||||||§r§4||||§r§7]
execute as @e[type=space:variables,scores={levelloading=29}] run title @a actionbar §7Loading[§r§2||||||||||||||§r§4|||§r§7]
execute as @e[type=space:variables,scores={levelloading=31}] run title @a actionbar §7Loading[§r§2|||||||||||||||§r§4||§r§7]
execute as @e[type=space:variables,scores={levelloading=33}] run title @a actionbar §7Loading[§r§2||||||||||||||||§r§4|§r§7]
execute as @e[type=space:variables,scores={levelloading=35}] run title @a actionbar §7Loading[§r§2|||||||||||||||||§r§4§r§7]
execute as @e[type=space:variables,scores={levelloading=37}] run title @a actionbar §7Loading[§r§2|||||||||||||||||§r§4§r§7]

#Load a planet based on the active portal
execute as @e[type=space:variables,scores={levelloading=38,destinationint=1}] run title @a actionbar §7Loaded: §4The Black Market
execute as @e[type=space:variables,scores={levelloading=38,destinationint=2}] run title @a actionbar §7Loaded: §fPalace Arena
execute as @e[type=space:variables,scores={levelloading=38,destinationint=3}] run title @a actionbar §7Loaded: §2Poison War-Ship
execute as @e[type=space:variables,scores={levelloading=38,destinationint=4}] run title @a actionbar §7Loaded: §2Red Valley
execute as @e[type=space:variables,scores={levelloading=38,destinationint=5}] run title @a actionbar §7Loaded: §2Apocolyptus

#Start up the loading sequence of the selected planet, will vary if it is a duel, the market, or back into the ship.

#Market setup
execute as @e[type=space:variables,scores={levelloading=38,destinationint=1}] run function market/start
#Palace arena set up
execute as @e[type=space:variables,scores={levelloading=38,destinationint=2}] run function battle/start

