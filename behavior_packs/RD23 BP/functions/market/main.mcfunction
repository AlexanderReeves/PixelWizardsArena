#This is the main running point for our marketplace code.
#say Rm
#Make the merchange face towards the nearest players always
execute as @e[type=space:merchant] at @s run tp @s ~ ~ ~ facing @p


#Return player to ship when on portal
execute as @a at @s run execute as @e[type=space:portal,r=1] run function ship/restart