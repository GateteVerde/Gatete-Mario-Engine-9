/// @description Fishbone logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region WAVE

	if (y > ystart)
	    yspeed -= 0.0125;
	else if (y < ystart)
	    yspeed += 0.0125;
#endregion

//Facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
