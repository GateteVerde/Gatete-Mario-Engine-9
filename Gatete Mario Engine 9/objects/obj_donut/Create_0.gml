/// @description Donut lift

/*
//  This item uses creation code.
//
//  ice    = To make this platform slippery
//			0: No
//			1: Yes
*/

//Default value:
ice = 0;

//Inherit the parent event
event_inherited();

//Whether this platform is falling
ready = 0;

//Offset
offset = 0;
alarm[1] = 1;

//Respawn time
respawn = 180;

//Respawn scale
scale = 0;

//Set ice properties
myslip = -1;
alarm[2] = 1;