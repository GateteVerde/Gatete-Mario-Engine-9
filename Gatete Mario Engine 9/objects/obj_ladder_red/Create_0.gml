/// @description Red On/Off Ladder

//Do not animate
image_speed = 0;

//Solid variable
myclimb = -1;

//If the on off switch is on
if (global.on_off_block == 0) {

	image_index = 0;
	myclimb = instance_create_layer(x, y, "Main", obj_climb);
	with (myclimb) {
	
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale * 3;
	}
}
else
	image_index = 1;