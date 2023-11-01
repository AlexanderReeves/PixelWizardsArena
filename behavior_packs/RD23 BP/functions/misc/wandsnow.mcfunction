#Summons a ranged snow attack entity that is a projectile for the snow ranged attack

#Summon the entity at the players location, facing the direction the player is facing
summon wizard:projectile_snow ~ ~1 ~ ~
scoreboard players set @e[type=wizard:projectile_snow,tag=!tagged] deathtimer 80
tag @e[type=wizard:projectile_snow] add tagged
