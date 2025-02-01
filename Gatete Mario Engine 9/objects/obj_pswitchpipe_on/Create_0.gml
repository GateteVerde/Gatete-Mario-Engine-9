/// @description P-Switch Pipe

/*
// DO NOT TILT THIS OBJECT, COLLISION WILL BREAK
*/

//Do not animate
image_speed = 0;

//Solid variable
mysolid = -1;

//If the on off switch is on
if (obj_levelcontrol.pswitch_on == false) {

	image_index = 0;
	mysolid = instance_create_layer(xstart, ystart, "Main", obj_solid);
	with (mysolid) {
	
		image_xscale = 0.0625 * (other.sprite_width);
		image_yscale = 0.0625 * (other.sprite_height);
		x = other.bbox_left;
		y = other.bbox_top;
	}
}
else
	image_index = 1;