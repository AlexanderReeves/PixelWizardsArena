#check each players current staff id and wand id, make sure they have it in their inventory

#reset inventory
execute as @a run clear

#give correct staff, - not the real item, but an empty replica item with the correct icon
#this way nothing will render on the steve body
execute as @a[scores={staffid=1}] run give @s wizard:ipractise_staff

#give correct wand
execute as @a[scores={wandid=1}] run give @s wizard:ipractise_wand

#give correct trap, based on trapamount score
#4 traps
execute as @a[scores={trapid=1,trapamount=1}] run give @s wizard:ipull_trap 1
execute as @a[scores={trapid=1,trapamount=2}] run give @s wizard:ipull_trap 2
execute as @a[scores={trapid=1,trapamount=3}] run give @s wizard:ipull_trap 3
execute as @a[scores={trapid=1,trapamount=4}] run give @s wizard:ipull_trap 4