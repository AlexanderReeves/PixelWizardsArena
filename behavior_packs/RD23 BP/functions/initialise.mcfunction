#Welcome to RObot Duels 23: This is the plugin initialisation page.

#............LETS BEGIN!
tellraw @a {"rawtext":[{"text":"§3Loading the Robot Duels 23 plugin."}]}

#Clear out all old game data and variables
tellraw @a {"rawtext":[{"text":"§4Clearing old scoreboards."}]}

#Set the ticking area with the MAIN command block to always be active (Above our ship)
tickingarea add -41.97 217.20 -37.51 -41.97 217.20 -37.51 main true
#Tickingarea for our marketplace so it loads properly
tickingarea add 281.77 136.85 156.85 215.96 139.00 230.11 market true
#TIckingarea for the palace arena
tickingarea add -117.49 226.00 392.58 -185.80 203.36 321.52 palace true

#============================ GAME RULES:
gamerule commandblocksenabled true
gamerule sendcommandfeedback false
gamerule domobloot false
gamerule dotiledrops false
gamerule domobspawning false
gamerule dodaylightcycle false
gamerule doweathercycle false
gamerule commandblockoutput false
gamerule tntexplodes false
gamerule mobgriefing false
gamerule mobgriefing false
gamerule keepinventory true
gamerule randomtickspeed 0
gamerule pvp false
gamerule falldamage false
gamemode a @a

#=============RESET ALL PLAYERS
tag @a remove joined


#==================SUMMON ENTITIES IN SHIP==========
#Remove ALL previous game entities
kill @e[type=!player]
#Summon the ship chairs
summon space:chair -49 203 -39 180
tag @e[type=space:chair] add tradschair
summon space:chair -39 203 -41 180
tag @e[tag=!tradschair,type=space:chair] add captainschair
summon space:chair -29 203 -39 180
tag @e[tag=!tradschair,tag=!captainschair,type=space:chair] add sparechair
#Summon panels
summon space:shiplever -37.6 205 -43.4
summon space:leftbutton -40.7 204.3 -43
summon space:rightbutton -36.4 204.3 -43
summon space:controls -39 203 -42.8


#Ship NPC and Mechanic minions
kill @e[type=space:mechanic]
kill @e[type=minecraft:npc]
summon minecraft:npc -48 203 -36
summon space:mechanic -34 205 -25
summon space:mechanic -49 203 -31
summon space:mechanic -47 205 -20

#Ship cool visual lightbeam entity that goes up in the pillars
kill @e[type=space:lightbeam]
summon space:lightbeam -27 202 -29

#The lobby robot which players can use to customise and view their personal robot settings 
#lobby bot
kill @e[type=wizard:wizard]
summon wizard:wizard -39 206 -17
tag @e[type=wizard:wizard,c=1] add display
#Set it's armour items to alter it's display properties (Auto rotate and size)
replaceitem entity @e[tag=display] slot.armor.legs 0 iron_leggings

#===========FLOATING TEXT PANELS==========
summon armor_stand -38.48 203.50 -38.53 0 0 sas:nametag_show_t "Captains Chair"
summon armor_stand -39 205.00 -44.28 0 0 sas:nametag_show_t "Press the lever to start flying the ship."
#tag @e[type=armor_stand,tag=!tagged] add shiptext
#tag @e[type=armor_stand] add tagged


#Set up scoreboards to hold our variables
#the space:variables entity will hold our variables
summon space:variables -38.31 217.00 -28.97

#main timer for ticks and seconds, 20 ticks per seclnd
scoreboard objectives add ticks dummy ticks
scoreboard players set @e[type=space:variables] ticks 20
#Ship launch stats
scoreboard objectives remove launchcountdown
scoreboard objectives add launchcountdown dummy launchcountdown
scoreboard players set @e[type=space:variables] launchcountdown 0


#Determine the state of the game
scoreboard objectives remove gamestate
scoreboard objectives add gamestate dummy gamestate
scoreboard players set @e[type=space:variables] gamestate 1
#Determine the SUB-CATEGORY of the game state
scoreboard objectives remove battlestate
scoreboard objectives add battlestate dummy battlestate
scoreboard players set @e[type=space:variables] battlestate 0
#Also one more gamestate for basically the tutorial, as its on the same arena as 
#the palace, we don't want it to clash with palace arenas running
scoreboard objectives remove tutorialstate
scoreboard objectives add tutorialstate dummy tutorialstate
scoreboard players set @e[type=space:variables] tutorialstate 0

#Variable to set each players unique identifier
#well start our variable entity as 1 and iterate up with each new player and assign them the current iteration
#this scoreboard is not currently utilised
scoreboard objectives remove iditerarion
scoreboard objectives remove playerid
scoreboard objectives add iditeration dummy iditeration
scoreboard objectives add playerid dummy playerid
scoreboard players set @e[type=space:variables] iditeration 1

#Scoreboards to make sure players were present when assigning was done
scoreboard objectives remove gsiterate
scoreboard objectives add gsiterate dummy gsiterate
scoreboard players set @e[type=space:variables] gsiterate 1
scoreboard objectives setdisplay sidebar gsiterate

#Scoreboard objectives for checking what map is loaded
scoreboard objectives remove levelloading
scoreboard objectives add levelloading dummy levelloading
scoreboard players set @e[type=space:variables] levelloading 0

#Scoreboard to count the number of online players at any time
scoreboard objectives remove activeplayers
scoreboard objectives add activeplayers dummy activeplayers
scoreboard players set @e[type=space:variables] activeplayers 0

#Scoreboard to check which travel portal is being activated
scoreboard objectives remove destinationint
scoreboard objectives add destinationint dummy destinationint
scoreboard players set @e[type=space:variables] destinationint 0


#more battle specific variables
#healthbar current health
scoreboard objectives remove hb
scoreboard objectives add hb dummy hb

#Tutorial scoreboard to determine of the dummy is going backwards or forwards
scoreboard objectives remove dummydirectiontimer
scoreboard objectives add dummydirectiontimer dummy dummydirectiontimer

#objective to track the cooldown time between attacks a robot can perform
scoreboard objectives remove botatkcooldown
scoreboard objectives add botatkcooldown dummy botatkcooldown

#objective to track the current staff of a player
scoreboard objectives remove staffid
scoreboard objectives add staffid dummy staffid
#and the wand
scoreboard objectives remove wandid
scoreboard objectives add wandid dummy wandid

#scoreboard to track the weapon initially held when starting an attack
scoreboard objectives remove initialweapon
scoreboard objectives add initialweapon dummy initialweapon
#and also the current weapon to compare and detect any change
scoreboard objectives remove activeweapon
scoreboard objectives add activeweapon dummy activeweapon

#Objective to be used as an iterator for single use at any time when needed
scoreboard objectives remove iterator
scoreboard objectives add iterator dummy iterator
scoreboard players set @e[type=space:variables] iterator 0