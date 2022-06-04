/// @description Move towards Mario

//If the NPC is not moving
if (xspeed == 0) {

	//If Mario does not exist or Mario is at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = (swimming == true) ? -0.5 : -1;
	else
		xspeed = (swimming == true) ? 0.5 : 1;
}

//Blink
alarm[0] = 180;

//Blow up
alarm[1] = 240;

//Turn towards Mario
alarm[11] = 60;
