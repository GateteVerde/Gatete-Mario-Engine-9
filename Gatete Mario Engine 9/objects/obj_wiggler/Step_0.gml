/// @description Wiggler logic

//Inherit the parent event
event_inherited();

//Face towards direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;