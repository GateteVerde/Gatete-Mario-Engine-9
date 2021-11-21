/// @description P-Switch Platform logic

//If the on/off switch is on
if (obj_levelcontrol.pswitch_on == false) {

	image_index = 0;
	if (mysolid == -1)
		mysolid = instance_create_layer(x, y, "Main", obj_solid);
}

//Otherwise, if the on/off switch is off
else if (obj_levelcontrol.pswitch_on == true) {

	image_index = 1;
	if (mysolid != -1) {
	
		with (mysolid) instance_destroy();
		mysolid = -1;
	}
}