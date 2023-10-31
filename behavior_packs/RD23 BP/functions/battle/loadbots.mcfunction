#OKAY SO! This is going to be a long one
#We essentially need to load 4 robots onto the current map, and then assign 4 players to those robots
#Any other players apart from the first 4 will just miss out, but it keeps the codebase a reasonable size...
#We are basically using the Travel/Start code again here, but with alterations depending on which of the 4 arenas is selected.... Let's get into it.
#You can view the simplified version on the travel/start if this is too much to digest.

#Debugging code so we know this page is still working
#say (loadbots) robots are being loaded and assigned to players.

#Remove the old robots to start
kill @e[type=wizard:wizard]

#check how many robots we need according to the number of players (4 maximum), var is activeplayers
function misc/countplayers

#=============================FIRST ROBOT==================
#Summon our first robot at the correct destination according to destinationint
execute as @e[type=space:variables,scores={activeplayers=1..,destinationint=2}] run summon wizard:wizard  -148.40 207.00 365.65 180 0
execute as @e[type=space:variables,scores={activeplayers=1..,destinationint=3}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=1..,destinationint=4}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=1..,destinationint=5}] run summon wizard:wizard -148.40 207.00 361.94
#Assign a tag to the 1st robot
tag @e[type=wizard:wizard,tag=!assignednum] add wiz1
tag @e[type=wizard:wizard] add assignednum


#==================REPEAT THIS FOR THE NEXT 3 ROBOTS========
#SECOND ROBOT
execute as @e[type=space:variables,scores={activeplayers=2..,destinationint=2}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=2..,destinationint=3}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=2..,destinationint=4}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=2..,destinationint=5}] run summon wizard:wizard -148.40 207.00 361.94
tag @e[type=wizard:wizard,tag=!assignednum] add wiz2
tag @e[type=wizard:wizard] add assignednum

#THIRD ROBOT
execute as @e[type=space:variables,scores={activeplayers=3..,destinationint=2}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=3..,destinationint=3}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=3..,destinationint=4}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=3..,destinationint=5}] run summon wizard:wizard -148.40 207.00 361.94
tag @e[type=wizard:wizard,tag=!assignednum] add wiz3
tag @e[type=wizard:wizard] add assignednum

#FOURTH ROBOT
execute as @e[type=space:variables,scores={activeplayers=4..,destinationint=2}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=4..,destinationint=3}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=4..,destinationint=4}] run summon wizard:wizard -148.40 207.00 361.94
execute as @e[type=space:variables,scores={activeplayers=4..,destinationint=5}] run summon wizard:wizard -148.40 207.00 361.94
tag @e[type=wizard:wizard,tag=!assignednum] add wiz4
tag @e[type=wizard:wizard] add assignednum

#========================EACH ROBOT IS NOW SUMMONED AND TAGGED WITH A NUMBER============

#=================ASSIGN A PLAYER TO EACH OF THE CURRENT 4 ROBOTS==========

#Now each player needs to be assigned a bot, well just delete any unused robots afterwards
#Unnasign any robots from previous battles
tag @a remove hasrobot
tag @a remove wizard1
tag @a remove wizard2
tag @a remove wizard3
tag @a remove wizard4
tag @a remove robotspectator

#Each robot should find an owner who does not have a "hasrobot" tag
execute as @e[tag=wiz1] run tag @p[tag=!hasrobot] add wizard1
execute as @e[tag=wiz1] run tag @p[tag=wizard1] add hasrobot

execute as @e[tag=wiz2] run tag @p[tag=!hasrobot] add wizard2
execute as @e[tag=wiz2] run tag @p[tag=wizard1] add hasrobot

execute as @e[tag=wiz3] run tag @p[tag=!hasrobot] add wizard3
execute as @e[tag=wiz3] run tag @p[tag=wizard1] add hasrobot

execute as @e[tag=wiz4] run tag @p[tag=!hasrobot] add wizard4
execute as @e[tag=wiz4] run tag @p[tag=wizard1] add hasrobot

#Any remaining players will become spectators, so all either have "hasrobot" and number or"robotspectator"
tag @a[tag=!hasrobot] add robotspectator

#Now each robot has a player, and vice versa

#We should delete any remaining robots

#=============ASSIGN A BOTMARK TO EACH OF THE ROBOTS=======

##robot 1'a botmark
#summon a botmark at robots location
execute as @e[type=wizard:wizard,tag=wiz1] run summon space:botmark ~ ~ ~ ~ ~
#assign it to the robot with a matching tag
tag @e[type=space:botmark,tag=!tagged] add wizard1
tag @e[type=space:botmark,tag=!tagged] add tagged

##robot 2'a botmark
#summon a botmark at robots location
execute as @e[type=wizard:wizard,tag=wiz2] run summon space:botmark ~ ~ ~ ~ ~
#assign it to the robot with a matching tag
tag @e[type=space:botmark,tag=!tagged] add wizard2
tag @e[type=space:botmark,tag=!tagged] add tagged

##robot 3'a botmark
#summon a botmark at robots location
execute as @e[type=wizard:wizard,tag=wiz3] run summon space:botmark ~ ~ ~ ~ ~
#assign it to the robot with a matching tag
tag @e[type=space:botmark,tag=!tagged] add wizard3
tag @e[type=space:botmark,tag=!tagged] add tagged

##robot 4'a botmark
#summon a botmark at robots location
execute as @e[type=wizard:wizard,tag=wiz4] run summon space:botmark ~ ~ ~ ~ ~
#assign it to the robot with a matching tag
tag @e[type=space:botmark,tag=!tagged] add wizard4
tag @e[type=space:botmark,tag=!tagged] add tagged

#==Done botmarks

#load the weapon for each bot based on the riders staffid score
#default to 1 as players can't yet select weapons
scoreboard players set @e[type=wizard:wizard] staffid 1
replaceitem entity @e[scores={staffid=1}] slot.weapon.mainhand 0 iron_sword 1

#set all robot attack cooldown's to 0
scoreboard players set @e[type=wizard:wizard] botatkcooldown 0