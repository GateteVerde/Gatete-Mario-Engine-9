/// @description Blue On/Off Ladder

//Do not animate
image_speed = 0;

//Solid variable
myclimb = -1;

//If the on off switch is off
if (global.on_off_block == 1) {

	image_index = 1;
	myclimb = instance_create_layer(x, y, "Main", obj_climb);
	with (myclimb) {
	
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale * 3;
	}
}
else
	image_index = 0;