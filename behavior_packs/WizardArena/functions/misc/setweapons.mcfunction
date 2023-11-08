#Here we make sure that the player and wizard have matching weapons

#the player holds the data and inventory sports for the current wand and staff. (one of each)

#player 1, holding ipractise_staff as primary weapon
execute as @a[hasitem={item=wizard:ipractise_staff,location=slot.weapon.mainhand}] run replaceitem entity @e[tag=wiz1] slot.weapon.mainhand 1 wizard:practise_staff

#player 1, holding practise wand
execute as @a[hasitem={item=wizard:ipractise_wand,location=slot.weapon.mainhand}] run replaceitem entity @e[tag=wiz1] slot.weapon.mainhand 1 wizard:practise_wand

#player 1, holding pulltrap
execute as @a[hasitem={item=wizard:ipull_trap,location=slot.weapon.mainhand}] run replaceitem entity @e[tag=wiz1] slot.weapon.mainhand 1 wizard:pull_trap
