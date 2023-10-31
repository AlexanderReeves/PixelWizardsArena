#check each players current staff id and wand id, make sure they have it in their inventory

#reset inventory
execute as @a run clear

#give correct staff, - not the real item, but an empty replica item with the correct icon
#this way nothing will render on the steve body
execute as @a[scores={staffid=1},hasitem={item=wizard:ipractise_staff,quantity=0}] run give @s wizard:ipractise_staff

#give correct wand
execute as @a[scores={wandid=1},hasitem={item=wizard:ipractise_wand,quantity=0}] run give @s wizard:ipractise_wand