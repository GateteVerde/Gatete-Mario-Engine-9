/// @description Blue On/Off Ladder logic

//If the on/off switch is off
if (global.on_off_block == 1) {

	image_index = 1;
	if (myclimb == -1) {
																
		myclimb = instance_create_layer(x, y, "Main", obj_climb);
		with (myclimb) {
	
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale * 3;
		}
	}
}

//Otherwise, if the on/off switch is on
else if (global.on_off_block == 0) {

	image_index = 0;
	if (myclimb != -1) {
	
		with (myclimb) instance_destroy();
		myclimb = -1;
	}
}