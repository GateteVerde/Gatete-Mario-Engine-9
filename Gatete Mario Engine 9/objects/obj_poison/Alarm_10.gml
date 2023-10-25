/// @description Set the horizontal speed

if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = -1 + (swimming * 0.5);
else
	xspeed = 1 - (swimming * 0.5);