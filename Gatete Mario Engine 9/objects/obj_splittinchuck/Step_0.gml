/// @description Splittin' Chuck logic

//Inherit the parent event
event_inherited();

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;