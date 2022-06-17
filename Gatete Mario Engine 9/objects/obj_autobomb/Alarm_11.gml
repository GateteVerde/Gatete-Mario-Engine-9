/// @description Follow the player

//If the rider does exist
if (instance_exists(rider)) {

	//If there's no gravity
	if (xspeed != 0) {

		//If Mario does not exist or Mario is at the left
		if (!instance_exists(obj_mario))
		|| (obj_mario.x < x)
			xspeed = (swimming == true) ? -0.5 : -1;
		else
			xspeed = (swimming == true) ? 0.5 : 1;
	}
}

//Change direction
alarm[11] = 60 + irandom_range(0, 60);