/// @description Blue On/Off Platform

//Do not animate
image_speed = 0;

//Solid variable
mysolid = -1;

//If the on off switch is on
if (global.on_off_block == 1) {

	image_index = 1;
	mysolid = instance_create_layer(x, y, "Main", obj_solid);
}
else
	image_index = 0;