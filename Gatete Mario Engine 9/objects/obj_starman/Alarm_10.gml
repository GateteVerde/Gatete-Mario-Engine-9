/// @description Set the horizontal speed

if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = -0.5 + (swimming * 0.25);
else
	xspeed = 0.5 - (swimming * 0.25);