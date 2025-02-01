/// @description P-Switch Pipe logic

//If the on/off switch is on
if (obj_levelcontrol.pswitch_on == false) {

	image_index = 0;
	if (mysolid == -1) {
		
		mysolid = instance_create_layer(xstart, ystart, "Main", obj_solid);
		with (mysolid) {
	
			image_xscale = 0.0625 * (other.sprite_width);
			image_yscale = 0.0625 * (other.sprite_height);
		}
	}
}

//Otherwise, if the on/off switch is off
else if (obj_levelcontrol.pswitch_on == true) {

	image_index = 1;
	if (mysolid != -1) {
	
		with (mysolid) instance_destroy();
		mysolid = -1;
	}
}