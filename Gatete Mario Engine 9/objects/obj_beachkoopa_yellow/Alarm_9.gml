/// @description Turn towards Mario

//Repeat the process
alarm[9] = 60+round(random(60));

//If there's no gravity
if (yadd == 0) {

	//If Mario does not exist or Mario is at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xspeed = (swimming == true) ? -0.4 : -0.8;
	else
		xspeed = (swimming == true) ? 0.4 : 0.8;
}