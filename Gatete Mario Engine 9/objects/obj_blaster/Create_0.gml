/// @description Bill Blaster

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = 100;

//Shoot a bullet bill
alarm[0] = 60;

//Create solid mask
mysolid = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid)
	image_yscale = other.image_yscale;
