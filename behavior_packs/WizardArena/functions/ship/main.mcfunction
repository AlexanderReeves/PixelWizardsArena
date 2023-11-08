#MAIN CODE BASE FOR THE SHIP

#check for any entity interactions
function ship/interact

#If a launch countdown is happening, run the countsown sequence
execute as @e[type=space:variables,scores={launchcountdown=1..,ticks=20}] run function ship/countdown