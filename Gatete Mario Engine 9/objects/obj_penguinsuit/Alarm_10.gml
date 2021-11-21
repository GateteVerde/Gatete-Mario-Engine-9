/// @description Set the horizontal speed

if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = -0.25 + (swimming * 0.125);
else
	xspeed = 0.25 - (swimming * 0.125);