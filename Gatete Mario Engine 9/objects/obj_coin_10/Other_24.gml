/// @description Un-Freeze NPCs

//If the coin is affected by gravity
if (ready == 1) {

	//Unfreeze
	freeze = false;

	//Resume animation
	image_speed = save_ims;
	save_ims = 0;

	//Resume horizontal speed
	xspeed = save_xsp;
	save_xsp = 0;

	//Resume vertical speed
	yspeed = save_ysp;
	save_ysp = 0;

	//Resume gravity
	yadd = save_grav;
	save_grav = 0;
}