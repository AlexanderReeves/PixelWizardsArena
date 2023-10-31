#code runs when stick is present
tellraw @a {"rawtext":[{"text":"§3Launch sequence initiated."}]}

playanimation @e[type=space:shiplever] animation.shiplever.go
playanimation @e[type=space:controls] animation.controls.go

#if there is no active launch, begin a countdown
execute as @e[type=item,name="stick"] run execute as @e[type=space:variables,scores={launchcountdown=0}] run scoreboard players set @s launchcountdown 4
execute as @e[type=item,name="stick"] run execute as @e[type=space:variables,scores={launchcountdown=4}] run kill @e[type=item,name="stick"]
#launchcountdown is inactivated when variable is negative 0
#if the launch countdown is active, cancel it.
execute as @e[type=item,name="stick"] run execute as @e[type=space:variables,scores={launchcountdown=1..}] run titleraw @a subtitle {"rawtext":[{"text":"§6Launch cancelled."}]}
execute as @e[type=item,name="stick"] run execute as @e[type=space:variables,scores={launchcountdown=1..}] run titleraw @a title {"rawtext":[{"text":"§4"}]}
execute as @e[type=item,name="stick"] run execute as @e[type=space:variables,scores={launchcountdown=1..}] run scoreboard players set @s launchcountdown 0

#Remove launch stick
kill @e[type=item,name="stick"]
