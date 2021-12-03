/// @description Protect Mario from the horrors of swimming in-air

if (instance_exists(obj_mario))
&& (obj_mario.swimming == 1)
	obj_mario.swimming = 0;