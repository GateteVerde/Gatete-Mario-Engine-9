/// @description Inherit the player event

//If this is not a non-charging mole
if (charge == 0) {

	//Jump
	alarm[0] = 60;

	//Move towards the player
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
	    xspeed = -1;
	else
	    xspeed = 1;
}
