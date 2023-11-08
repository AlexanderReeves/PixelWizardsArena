#this code is run by all traps
#trap damage is the way a trap can hurt an enemy
#traps can either explode on contact
#or
#traps can deal area damage
#for now, we will juse have them hurt nearby enemies

#traps have a 1/30 chance to create damaging magic every tick.
# that should be one magic every 1.5s on average
#generate a random num 1 to 60 as the rng score of itself
scoreboard players random @s rng 1 120
execute at @s[scores={rng=1}] run summon wizard:trap_magic ~ ~0.5 ~


#tag it to match the creator

#set the expiry via deathtimer
scoreboard players set @e[type=wizard:trap_magic,tag=!tagged] deathtimer 20
#make trap magic look at it's target
# find and face anything tagged as enemy
execute as @e[type=wizard:trap_magic] at @s run tp @s ~ ~ ~ facing @e[tag=enemy,c=1,r=5]

#send trap magic towards it"s target
execute as @e[type=wizard:trap_magic] run execute at @s run tp @s ^ ^ ^0.2

tag @e[type=wizard:trap_magic,tag=!tagged] add tagged

#trapdamage needs to deal damage!
#practise snowflake damage
#                trapdamagebentity     set the score of nearby healthbars(excluding wizard healthbars), to current-1
execute as @e[type=wizard:trap_magic] at @s run scoreboard players add @e[tag=!wizardhb,type=space:healthbar,scores={hb=1..},r=0.1] hb -1

#remove the trapdamage when it has dealt it's damage via use of the deathtimer
execute as @e[tag=!wizardhb,type=space:healthbar] at @s run scoreboard players set @e[type=wizard:trap_magic,r=0.1] deathtimer 1