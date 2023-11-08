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

world.beforeEvents.chatSend.subscribe((eventData) => {
    world.sendMessage("Hello World");
    const player = eventData.sender;
    if (!player.hasTag('Admin')) return;
    switch (eventData.message) {
        case '!gmc':
            eventData.cancel = true;
            player.runCommandAsync('gamemode c');
            break;
        case '!gms':
            eventData.cancel = true;
            player.runCommandAsync('gamemode s');
            break;
        default: break;
    }
});
