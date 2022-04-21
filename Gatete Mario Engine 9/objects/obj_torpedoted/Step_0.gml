/// @description Torpedo Ted logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If moving right...
	if (xscale > 0) {

	    //Increment speed
	    xspeed += 0.025;
    
	    //Cap horizontal speed
	    if (xspeed > 3)
	        xspeed = 3;
	}

	//Otherwise, if moving left...
	else {

	    //Increment speed
	    xspeed -= 0.025;
    
	    //Cap horizontal speed
	    if (xspeed < -2)
	        xspeed = -2;
	}

	//Slow down vertical speed
	if (yspeed > 0)
	    yspeed -= 0.0125;
#endregion

//Destroy if outside the view
if (outside_view() == true)
	instance_destroy();
