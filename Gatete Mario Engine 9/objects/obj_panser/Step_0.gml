/// @description Panser logic

//Inherit the parent event
event_inherited();

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;