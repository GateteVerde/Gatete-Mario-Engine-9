/// @description Move towards the player

//If the NPC is not moving
if (xspeed == 0) {

	//If Mario does not exist or Mario is at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = -0.5;
	else
		xspeed = 0.5;
}

//Set turning endpoint
if (prevswim == 0) {

    prevswim = 1;
    xx = x;
}
