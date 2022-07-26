/// @description Reznor Platform

//Inherit the parent event
event_inherited();

//Is the platform solid
issolid = true;

//Parent of the object
parent = noone;

//Platform offset
block_offset = 0;
block_ready = 0;

//Create Reznor
reznor = instance_create_depth(x, y-16, -2, obj_reznor_enemy);
with (reznor) {

	parent = other.id;
}