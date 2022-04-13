/// @description Green Cheep Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//Wall collision
	ai_npc_wall(1);

	//If the cheep cheep is moving to the right.
	if (xspeed > 0) {

	    //Change direction
	    if (x > xstart+64)
	        xspeed = -xspeed;
	}

	//Otherwise, if the cheep cheep is moving to the left.
	else if (xspeed < 0) {
        
	    //Change direction.
	    if (x < xstart-64)    
	        xspeed = -xspeed;
	}

	//Wave
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
