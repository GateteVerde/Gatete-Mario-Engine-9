/// @description Permanent Moving Pipe

/*
// If you want this object to emerge from a bottomless pit, add it 16 pixels above the pit.
*/

//Inherit the parent event
event_inherited();

//Makes the instance fully solid
issolid = true;

//Do not animate
image_speed = 0;
image_index = 0;

//Check for nearest ground
ground = instance_nearest_below(x + 16, bbox_bottom, obj_semisolid);

//Left Side Collision
mysolid_l = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid_l)
	image_xscale = 0.25;

//Right Side Collision
mysolid_r = instance_create_layer(x+28, y, "Main", obj_solid);
with (mysolid_r)
	image_xscale = 0.25;