#say force ride is running
#Put players on their assigned ships
ride @p[tag=ship1] start_riding @e[tag=ship1,c=1] teleport_rider
ride @p[tag=ship2] start_riding @e[tag=ship2,c=1] teleport_rider
ride @p[tag=ship3] start_riding @e[tag=ship3,c=1] teleport_rider
ride @p[tag=ship4] start_riding @e[tag=ship4,c=1] teleport_rider

#Make all players invisible
effect @a invisibility 2 1 true