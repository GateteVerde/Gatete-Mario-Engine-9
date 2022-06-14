/// @description Move towards Mario

//Set vertical speed
yspeed = 1.5;

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = -0.5;
else
	xspeed = 0.5;