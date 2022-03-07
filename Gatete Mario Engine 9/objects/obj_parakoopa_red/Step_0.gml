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
	    if (yspeed > 1)
	        yspeed = 1;
        
	    //Change direction.
	    if (y > ystart+40)
	        dir = -1;
	}

	//Otherwise, if the parakoopa is moving to the left.
	else if (dir == -1) {

	    //Cap horizontal speed.
	    if (yspeed < -1)
	        yspeed = -1;
        
	    //Change direction.
	    if (y < ystart-40)
	        dir = 1;
	}

	//Increment / Decrement speed.
	yspeed += 0.02*sign(dir);

#endregion

//Facing direction
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;