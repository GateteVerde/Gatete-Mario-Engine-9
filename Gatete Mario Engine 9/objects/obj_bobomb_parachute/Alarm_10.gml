/// @description Move towards the player

//If Mario does not exist or Mario is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = random_range(0, (swimming == true) ? -0.25 : -0.5);
else
	xspeed = random_range(0, (swimming == true) ? 0.25 : 0.5);