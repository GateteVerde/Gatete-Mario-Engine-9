/// @description Start moving

//If Mario does exist
if (instance_exists(obj_mario))
	speed += 0.01;
	
//Otherwise
else
	alarm[2] = 1;