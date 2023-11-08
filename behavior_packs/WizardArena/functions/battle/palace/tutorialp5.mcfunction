#P4 start text
titleraw @a subtitle {"rawtext":[{"text":"§bCongratulations! Tutorial complete."}]}
titleraw @a title {"rawtext":[{"text":"§4"}]}
kill @e[type=space:healthbar,tag=enemy]
kill @e[type=space:dummy]
scoreboard players set @e[type=space:variables] tutorialstate 5

tellraw @a {"rawtext":[{"text":"§fWizard Wally: §dYou make it look easy! But you can return back to the tutorial from here if you ever want a refresher! Good luck in the arena."}]}


