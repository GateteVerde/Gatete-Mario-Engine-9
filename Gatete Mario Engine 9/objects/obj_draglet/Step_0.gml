/// @description Draglet logic

//Manage pseudo movement variables
if (freeze == false) {
	
	//Update anim
	anim += 0.2;

	//Vertical motion
	y += yspeed;
	
	//If not animating, allow horizontal motion
	if (image_speed == 0)
		x += xspeed;
}

#region MOVEMENT

	//If the enemy can move horizontally
	if (horiz == true) {

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
	}

	//Wave
	if (y > ystart)
	    yspeed -= 0.025;
	else if (y < ystart)
	    yspeed += 0.025;

#endregion

//Facing direction
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else if (obj_mario.x > x)
	xscale = 1;
