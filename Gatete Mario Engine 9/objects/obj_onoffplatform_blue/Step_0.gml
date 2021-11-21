/// @description Blue On/Off Block logic

//If the on/off switch is on
if (global.on_off_block == 1) {

	image_index = 1;
	if (mysolid == -1)
		mysolid = instance_create_layer(x, y, "Main", obj_solid);
}

//Otherwise, if the on/off switch is off
else if (global.on_off_block == 0) {

	image_index = 0;
	if (mysolid != -1) {
	
		with (mysolid) instance_destroy();
		mysolid = -1;
	}
}