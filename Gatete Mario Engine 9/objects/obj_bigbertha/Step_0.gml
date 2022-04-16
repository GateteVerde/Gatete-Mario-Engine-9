/// @description Big Bertha logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//If the boss bass is moving to the right
	if (dir == 1) {
        
	    //Change direction
	    if (x > xstart+24) {
			
	        dir = -1;
			if (hold == 2)
				hold = 0;
		}
		
		//Cap horizontal speed
		if (xspeed > 1.5)
			xspeed = 1.5;
	}

	//Otherwise, if the boss bass is moving to the left
	else if (dir == -1) {
        
	    //Change direction
	    if (x < xstart-24) {
			
	        dir = 1;
			if (hold == 2)
				hold = 0;
		}
		
		//Cap horizontal speed
		if (xspeed < -1.5)
			xspeed = -1.5;
	}

	//Allow/Disallow Big Bertha's movement
	if (hold != 1) {

	    //Check if the facing direction is not equal to the previous direction
	    if (xscale != prevdir) {
    
	        if ((random(round(100)) > 50) && (hold != 2)) {
        
	            //Set the spit sprite
	            sprite_index = spr_bigbertha_jump;
            
	            //Set new direction
	            prevdir = xscale;
                    
	            //Wait
	            hold = 1;
            
	            //Set the hspeed
	            xspeed = 0;
            
	            //Swallow a cheep
	            alarm[0] = 16;
	        }
	        else {
        
	            //Set new direction
	            prevdir = xscale;            
	        }
	    }

	    //Set the horizontal speed
	    xspeed += 0.04*sign(dir);
	}

	//Otherwise, stop
	else {

	    //Stop right there
	    xspeed = 0;
	}

	//Wave
	if (y > ystart)
	    yspeed -= 0.025;
	else if (y < ystart)
	    yspeed += 0.025;
		
#endregion
    
//Set the facing direction.
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
