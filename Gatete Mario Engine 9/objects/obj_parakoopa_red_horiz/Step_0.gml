/// @description Red Parakoopa logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region MOVEMENT

	//If the parakoopa is moving to the right.
	if (dir == 1) {
    
	    //Cap horizontal speed.
	    if (xspeed > 1)
	    xspeed = 1;
        
	    //Change direction.
	    if (x > xstart+40)
	        dir = -1;
	}

	//Otherwise, if the parakoopa is moving to the left.
	else if (dir == -1) {

	    //Cap horizontal speed.
	    if (xspeed < -1)
	    xspeed = -1;
        
	    //Change direction.
	    if (x < xstart-40)    
	        dir = 1;
	}

	//Increment / Decrement speed.
	xspeed += 0.02*sign(dir);

	//Wave
	if (y > ystart)
	    yspeed -= 0.025;
	else if (y < ystart)
	    yspeed += 0.025;

#endregion

//Facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;