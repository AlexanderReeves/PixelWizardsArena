#end the tutorial, either via gameplay or manually cancelling

#end tutorial early if the player walks to the quit portal
tellraw @a {"rawtext":[{"text":"§7The tutorial has ended."}]}
#there may be an entity remaining from the tutorial, we can remove any here
scoreboard players set @e[type=space:variables] tutorialstate 0
kill @e[type=space:dummy]
kill @e[type=space:healthbar,tag=!wizardhb]
kill @e[type=wizard:lightning]
kill @e[type=space:orb]
kill @e[type=wizard:pull]
kill @e[type=space:portal]
kill @e[type=armor_stand]

#restart arena lobby
function battle/palace/start