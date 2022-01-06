/// @description Turnip Shell

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Allow collision
allow_collision = true;

//Create semisolid collision
mytop = instance_create_layer(-1000, -1000, "Main", obj_platformparent)
with (mytop)
	image_xscale = 1/3;