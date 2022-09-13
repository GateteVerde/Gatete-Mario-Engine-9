/// @description Handle block movement if not static

//If the object is not frozen
if ((freeze == false) && (ready > 0)) {

	//If the object is moving back and forth
	if (ready == 1)
	&& (backnforth == true) {

	    //If the block is moving to the right.
	    if (dir == 1) {
        
	        //Cap horizontal speed.
	        if (hspeed > 1)
	        hspeed = 1;
            
	        //Change direction.
	        if (x > xstart+32)
	            dir = -1;
	    }
    
	    //Otherwise, if the block is moving to the left.
	    else if (dir == -1) {
    
	        //Cap horizontal speed.
	        if (hspeed < -1)
	        hspeed = -1;
            
	        //Change direction.
	        if (x < xstart-32)    
	            dir = 1;
	    }
    
	    //Increment / Decrement speed.
	    hspeed += 0.0125*sign(dir);
	}

	//Wave
	if (y > ystart)
	    vspeed -= 0.015;
	else if (y < ystart)
	    vspeed += 0.015;
}