/// @description Block Train Front

//Inherit the parent event
event_inherited();

//Make it solid
issolid = true;

//Make it not able to transport Mario or NPCs
no_horiz = true;

//Length
length = 0;

//Direction of last block
dir = 0;

//Allow creation of blocks
ready = 0;

//Whether this platform makes noise
noise = 0;

//Delay platform creation
alarm[1] = 1;