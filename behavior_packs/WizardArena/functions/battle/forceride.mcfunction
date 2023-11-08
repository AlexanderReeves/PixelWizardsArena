#say force ride is running

#Put all riders on their allocated robot!
ride @a[tag=wizard1] start_riding @e[tag=wiz1,c=1] teleport_rider
ride @a[tag=wizard2] start_riding @e[tag=wiz2,c=1] teleport_rider
ride @a[tag=wizard3] start_riding @e[tag=wiz3,c=1] teleport_rider
ride @a[tag=wizard4] start_riding @e[tag=wiz4,c=1] teleport_rider

#player invisibility while riding
effect @a invisibility 2 1 true