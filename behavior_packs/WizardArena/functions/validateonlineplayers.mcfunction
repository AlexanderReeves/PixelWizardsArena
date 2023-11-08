#This code will slowly iterate upwards between different gamestates.
#It endlessly goes up 1 int each time the gamestate changes
#All players online will get given the new int which makes them "valid" at this time
#Anyone who signs in, and does not have a valid/matching number is invalid!
#Anyone who is invalid will be reset by "main" which constantly checks for invalid players via "invalidplayers.mcf"


#Increase our current gamestate iteration number as the gamestate must have just changed.
scoreboard players add @e[type=space:variables] gsiterate 1

#Make sure all online players get that new number, so we know they are valid players!
scoreboard players set @a gsiterate 0
scoreboard players operation @a gsiterate += @e[type=space:variables] gsiterate

#Let's take this chance to add a failsafe and set players magiccharge to 0 as well
scoreboard players set @a magiccharge 0

