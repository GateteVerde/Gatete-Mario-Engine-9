/// @description Amazing Flying Hammer Bro

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Make the platform solid
issolid = true;

//Position
angle = 0;
mytimer = 0;
distance = 64;
myx = xstart+distance;
myy = ystart;

//Block offsets
block_offset_l = 0;
block_offset_r = 0;
block_ready = 0;

//Check if moving
moving = false;

//Animate
alarm[0] = 9;

//Start moving
alarm[10] = 2;

//Create Amazing Flying Hammer Bro
with (instance_create_depth(x, y, -2, obj_afhb_rider))
	parent = other.id;