/// @description Skull Raft

//Inherit the parent event
event_inherited();

//Makes the object fully solid
issolid = true;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Depth
depth = 101;

//Move 4 pixels downwards
y += 4;

//Left raft
myl = collision_point(x-8, y+8, obj_platform_skull, 0, 1);

//Right raft
myr = collision_point(x+24, y+8, obj_platform_skull, 0, 1);

//Length
length = 0;

//State variable
ready = 0;

//Calculate length from leftmost skull in raft
if (myr == noone)
	while (position_meeting(x-8-length, y+8, obj_platform_skull))
		length += 16;