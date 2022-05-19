/// @description Para Beetle logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//Check for Mario
	var passenger = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top-5, obj_mario, 0, 0);
	
	//If Mario is above this enemy
	if (passenger) 
	&& (passenger.state < playerstate.jump) {

	    //Make the parabeetle go down
	    if (ready == 0) {
    
	        //Move down
	        ready = 1;
        
	        //Set the vertical speed
	        yspeed = 1.5;
	    }
	}

	//Otherwise, stop vertical speed.
	else {

	    //Prepare to move down again
	    ready = 0;
    
	    //Stop vertical speed
	    yspeed = 0;
	}

	//If the parabeetle is carrying Mario.
	if (ready == 1)
	    yspeed += -0.1;

	//Otherwise, if it's not carryying him.
	else {

	    //Manage vertical speed.
	    if (yspeed < 0)
	        yspeed += 0.25;
	    else
	        yspeed = 0;
	}

	//Cap vertical speed
	if (yspeed < -1) 
	    yspeed = -1;
	else if (yspeed > 1.5) 
	    yspeed = 1.5;
#endregion

#region FACING DIRECTION

	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
#endregion

//Set animation speed
image_speed = (ready == 1) ? 2 : 1;
