#Reflect every players remaining charges in their xp bars
#Set all xp bars to 0 to start
xp -100L @a
#add xp bar based on magicharges score, followed by a fraction of the next level based on current number
xp 1L @a[scores={magiccharge=1}]
xp 1 @a[scores={magiccharge=1}]

xp 2L @a[scores={magiccharge=2}]
xp 2 @a[scores={magiccharge=2}]

xp 3L @a[scores={magiccharge=3}]
xp 4 @a[scores={magiccharge=3}]

xp 4L @a[scores={magiccharge=4}]
xp 6 @a[scores={magiccharge=4}]

xp 5L @a[scores={magiccharge=5}]
xp 8 @a[scores={magiccharge=5}]

xp 6L @a[scores={magiccharge=6}]
xp 11 @a[scores={magiccharge=6}]

xp 7L @a[scores={magiccharge=7}]
xp 14 @a[scores={magiccharge=7}]

xp 8L @a[scores={magiccharge=8}]
xp 18 @a[scores={magiccharge=8}]

xp 9L @a[scores={magiccharge=9}]
xp 23 @a[scores={magiccharge=9}]

xp 10L @a[scores={magiccharge=10}]
xp 26 @a[scores={magiccharge=10}]