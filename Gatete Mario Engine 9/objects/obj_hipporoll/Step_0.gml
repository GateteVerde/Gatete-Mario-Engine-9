/// @description Hipporoll logic

//Inherit the parent event
event_inherited();

//Set angle based on speed
angle += (ready == 1) ? -10 * xscale : 0;

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;