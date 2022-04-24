/// @description Move towards Mario

//Allow slowdown
ready = 1;

//If Mario does not exist or Mario is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = -3;
else
	xspeed = 3;
