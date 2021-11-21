/// @description P-Switch Platform

//Do not animate
image_speed = 0;

//Solid variable
mysolid = -1;

//If the on off switch is on
if (obj_levelcontrol.pswitch_on == false) {

	image_index = 0;
	mysolid = instance_create_layer(x, y, "Main", obj_solid);
}
else
	image_index = 1;