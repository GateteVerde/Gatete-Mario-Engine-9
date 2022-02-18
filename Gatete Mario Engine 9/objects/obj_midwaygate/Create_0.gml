/// @description SMW Midway Gate

//Depth
depth = 150;

//Create front pole
with (instance_create_depth(x+16, y, -6, obj_midwaygate_front))
	image_yscale = other.image_yscale;