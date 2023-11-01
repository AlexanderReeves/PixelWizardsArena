#Say the tutorial is running

#=====PART 1, COLLECT THE ORBS======
execute as @e[type=space:variables,scores={tutorialstate=1}] run titleraw @a actionbar {"rawtext":[{"text":"§71. §6Collect the orbs by walking around."}]}

#Delete orbs when a robot is near!
execute as @e[type=wizard:wizard] at @s run execute as @e[type=space:orb,r=1] run particle minecraft:totem_particle
execute as @e[type=wizard:wizard] at @s run execute as @e[type=space:orb,r=1] run particle minecraft:totem_particle
execute as @e[type=wizard:wizard] at @s run execute as @e[type=space:orb,r=1] run effect @s invisibility 1 1 true
execute as @e[type=wizard:wizard] at @s run execute as @e[type=space:orb,r=1] run kill @s



#Check if there is an orb present, if not skip to part 2.
#By default, lets assume no orbs
tag @e[type=space:variables,scores={tutorialstate=1}] add noorbs
#And in that case, while in state 1, if there are no orbs, remove the tag
execute as @e[type=space:orb] run tag @e[type=space:variables,scores={tutorialstate=1}] remove noorbs

#If we are in state 1, but there are no orbs, start part 2

#=====PART 2, ATTACK THE DUMMY ====
#P2 start message
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run titleraw @a subtitle {"rawtext":[{"text":"§bOrbs Collected!"}]}
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run titleraw @a title {"rawtext":[{"text":"§4"}]}
#summon the dummy

#Remove preivous dummies and dummy healthbars
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run kill @e[type=space:dummy]
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run kill @e[type=space:healthbar,tag=dummy]

execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run summon space:dummy -151.5 207.00 368.5
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run tag @e[type=space:dummy] add dummy
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run summon space:healthbar -151.5 207.00 368.5
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run tag @e[type=space:healthbar,tag=!tagged] add dummy
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run tag @e[type=space:healthbar,tag=!tagged] add tagged
#Set the healthbar of the dummy to a hb score of 15
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run scoreboard players set @e[type=space:healthbar,tag=dummy] hb 15

#Set the score of the dummy to 0, and increase it until it reaches 280, then reset it
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] run scoreboard players set @e[type=space:dummy] dummydirectiontimer 0
#

#=============Part 2 has been started and is now in progress.

#dummy moves forward then backwards depending on tick int score
#When the score is 0 to 69, goes forward
execute as @e[type=space:variables,scores={tutorialstate=2..3}] run execute at @e[type=space:dummy,scores={dummydirectiontimer=0..199}] run tp @e[type=space:dummy] ~ ~ ~-0.05 180 ~
#When the score is 70 to 140, go backwards
execute as @e[type=space:variables,scores={tutorialstate=2..3}] run execute at @e[type=space:dummy,scores={dummydirectiontimer=200..400}] run tp @e[type=space:dummy] ~ ~ ~0.05 0 ~

#increase tick int score
execute as @e[type=space:variables,scores={tutorialstate=2..3}] run scoreboard players add @e[type=space:dummy] dummydirectiontimer 1
#reset the score back to 0 when completed
execute as @e[type=space:variables,scores={tutorialstate=2..3}] run scoreboard players set @e[type=space:dummy,scores={dummydirectiontimer=400}] dummydirectiontimer 0


scoreboard players set @e[type=space:variables,tag=noorbs,scores={tutorialstate=1}] tutorialstate 2

#P2 objective message
execute as @e[type=space:variables,scores={tutorialstate=2}] run titleraw @a actionbar {"rawtext":[{"text":"§72.§6 Attack the dummy by equiping your staff and walking towards it."}]}

execute as @e[type=space:variables,scores={tutorialstate=2}] run ride @e[type=space:healthbar,tag=dummy] start_riding @e[type=space:dummy,c=1] teleport_rider

#Load tutorial part 3 when the dummy dies
execute as @e[type=space:variables,scores={tutorialstate=2}] run tag @s add dummyalive
execute as @e[type=space:variables,scores={tutorialstate=2}] run execute as @e[type=space:healthbar,scores={hb=..0}] run tag @e[type=space:variables] remove dummyalive
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=2},tag=!dummyalive] run function battle/palace/tutorialp3

#P3 objective message
execute as @e[type=space:variables,scores={tutorialstate=3}] run titleraw @a actionbar {"rawtext":[{"text":"§72. §6Attack the dummy with your wand from a distance (Charge it with a powerup)."}]}

#P3 summon lightning if a player has no charges
execute as @e[type=space:variables,scores={tutorialstate=3}] run execute as @a[scores={magiccharge=0}] run execute unless entity @e[type=wizard:lightning] run summon wizard:lightning -139.74 207.35 362.58

#Load tutorial part 4 when the dummy dies again
execute as @e[type=space:variables,scores={tutorialstate=3}] run tag @s add dummyalive
execute as @e[type=space:variables,scores={tutorialstate=3}] run execute as @e[type=space:healthbar,scores={hb=..0}] run tag @e[type=space:variables] remove dummyalive
execute as @e[type=space:variables,tag=noorbs,scores={tutorialstate=3},tag=!dummyalive] run function battle/palace/tutorialp4

#P4 objective message
execute as @e[type=space:variables,scores={tutorialstate=4}] run titleraw @a actionbar {"rawtext":[{"text":"§72. §6Walk backwards to drop a trap for the dummy."}]}




