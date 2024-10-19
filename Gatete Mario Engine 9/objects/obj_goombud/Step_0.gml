/// @description Goombud logic

//Inherit the parent event
event_inherited();

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;