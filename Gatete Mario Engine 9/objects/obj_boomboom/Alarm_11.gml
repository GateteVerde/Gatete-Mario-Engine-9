/// @description Move towards Mario

//If Boom-Boom is not moving
if ((yadd == 0) && (xspeed != 0)) {
	
	//Animation speed
	image_speed = 0.2 * increment;
	
	//Move towards Mario
	alarm[11] = 60;

	//If Mario does not exist or Mario is at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = (swimming == true) ? -0.5 * (increment / 2) : -1 * increment;
	else
		xspeed = (swimming == true) ? 0.5 * (increment / 2) : 1 * increment;
}