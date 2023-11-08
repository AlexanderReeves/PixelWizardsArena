#when a player interacts with a button or entity in the ship, the should respond

#When the player hits the control deck lever, a stick is generated.
execute as @e[type=minecraft:item,name="stick"] run function ship/launchstick
