/// @description Move towards the player

//If the NPC is not moving
if (xspeed == 0) {

	//If Mario does not exist or Mario is at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = (swimming == true) ? -0.25 : -0.5;
	else
		xspeed = (swimming == true) ? 0.25 : 0.5;
}