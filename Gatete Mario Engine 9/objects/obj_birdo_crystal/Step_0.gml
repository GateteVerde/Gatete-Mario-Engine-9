/// @description Turn into a regular crystal

//Inherit the parent event
event_inherited();

//Turn into a regular crystal
if (bounces == 0) {

	instance_create_depth(x, y, -2, obj_crystal);
	instance_destroy();
	exit;
}