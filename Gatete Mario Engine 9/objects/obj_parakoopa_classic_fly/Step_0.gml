/// @description Flying Classic Parakoopa logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Enemy collision
event_user(2);

#region FACING DIRECTION

	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;

#endregion

//Wave
if (y > ystart)
    yspeed -= 0.025;
else if (y < ystart)
    yspeed += 0.025;
