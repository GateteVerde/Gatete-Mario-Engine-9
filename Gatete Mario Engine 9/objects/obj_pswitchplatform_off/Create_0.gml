/// @description P-Switch Platform

//Do not animate
image_speed = 0;

//Solid variable
mysolid = -1;

//If the on off switch is on
if (obj_levelcontrol.pswitch_on == true) {

	image_index = 1;
	mysolid = instance_create_layer(x, y, "Main", obj_solid);
	with (mysolid) {
	
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
}
else
	image_index = 0;