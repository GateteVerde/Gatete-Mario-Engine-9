/// @description Abandoned Yoshi logic

//Inherit event from parent
event_inherited();

//Bounce
if (yadd == 0) {

	//Set the vertical speed
	yspeed = (swimming) ? -0.75 : -1.5;
	
	//Stop horizontal speed
	if (xspeed != 0)
		xspeed = 0;
}

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;