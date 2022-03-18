/// @description Move towards Mario

//If the NPC is not moving
if (xspeed == 0) {
	
	//Turn towards Mario
	alarm[9] = 60;

	//If Mario does not exist or Mario is at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = (swimming == true) ? -0.4 : -0.8;
	else
		xspeed = (swimming == true) ? 0.4 : 0.8;
}