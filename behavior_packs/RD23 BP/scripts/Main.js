// This file demonstrates that the code is working by
// Spamming the chat with "Hello World"

// Import world component from "@minecraft/server"
import { world, system } from '@minecraft/server';

// Subscribe to an event that calls every Minecraft tick
//system.runInterval(() => {
// Spams the chat with "Hello World" with world.sendMessage function in API
//world.sendMessage("Hello World");

// or run a command in overworld dimension
// using native API methods (such as world.sendMessage) are recommended whenever possible.
//world.getDimension("overworld").runCommand("say Hello World");
//});

system.runInterval(() => {
	// Spams the chat with "Hello World" with world.sendMessage function in API
	//world.sendMessage("running");
	// or run a command in overworld dimension
	// using native API methods (such as world.sendMessage) are recommended whenever possible.
    const theEntity = world.getDimension("overworld").getEntities({type:"space:robot"})


    //BIG CIRCLES SMALL DISTANCE = priorisite ne, nw, Small circles, big distance = prioritise N, S , E, W
    //APPLY KNOCKBACK TO ENEMIES WHEN ATTACKED
    //We have tagged all enemies that we attack based on their direction from our location when attacking (i.e north on compass from our position)

    if(theEntity[0].hasTag("north")){
        theEntity[0].applyKnockback(0, 1, 1, 0.3);
        theEntity[0].removeTag("north");
    }
    if(theEntity[0].hasTag("south")){
        theEntity[0].applyKnockback(0, -1, 1, 0.3);
        theEntity[0].removeTag("south");
    }
    if(theEntity[0].hasTag("east")){
        theEntity[0].applyKnockback(-1, 0, 1, 0.3);
        theEntity[0].removeTag("east");
    }
    if(theEntity[0].hasTag("west")){
        theEntity[0].applyKnockback(1, 0, 1, 0.3);
        theEntity[0].removeTag("west");
    }
    if(theEntity[0].hasTag("northeast")){
        theEntity[0].applyKnockback(-1, 1, 1, 0.3);
        theEntity[0].removeTag("northeast");
    }
    if(theEntity[0].hasTag("northwest")){
        theEntity[0].applyKnockback(1, 1, 1, 0.3);
        theEntity[0].removeTag("northwest");
    }
    if(theEntity[0].hasTag("southeast")){
        theEntity[0].applyKnockback(-1, -1, 1, 0.3);
        theEntity[0].removeTag("southeast");
    }
    if(theEntity[0].hasTag("southwest")){
        theEntity[0].applyKnockback(1, -1, 1, 0.3);
        theEntity[0].removeTag("southwest");
    }


    
    
    
});