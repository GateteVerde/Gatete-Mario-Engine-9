/// @description Block Train Back

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

//Create platform
instance_create_depth(xstart, ystart, depth, obj_blocktrain_killer);