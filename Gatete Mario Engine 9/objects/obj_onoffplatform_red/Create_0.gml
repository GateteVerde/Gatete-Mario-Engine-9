/// @description Red On/Off Platform

//Do not animate
image_speed = 0;

//Solid variable
mysolid = -1;

//If the on off switch is on
if (global.on_off_block == 0) {

	image_index = 0;
	mysolid = instance_create_layer(x, y, "Main", obj_solid);
	with (mysolid) {
	
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
}
else
	image_index = 1;