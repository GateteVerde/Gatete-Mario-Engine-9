/// @description Follow Mario

//If the enemy is moving
if (xspeed != 0) {

	//Start moving
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
	    xspeed = -0.5;
	else
	    xspeed = 0.5;
}

//Change direction
alarm[11] = 60 + irandom_range(0, 60);