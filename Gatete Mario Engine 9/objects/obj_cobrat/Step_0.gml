/// @description Cobrat logic

//If the object is buried
if (ready == 0) {

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario is nearby, jump
        if (obj_mario.x > x-32)
        && (obj_mario.x < x+32) {
        
            //Set the vertical speed
            yspeed = -3;
            y = ystart;
            
            //Boost jump
            y--;
            
            //Come out
            ready = 1;
        }
    }

	#region OFFSET
	
		//Set y position
		y += 0.25*sign(ready2);

		//Change the offset movement
		if (y < ystart-8)
		    ready2 = 1;
		else if (y > ystart)
		    ready2 = -1;	
	#endregion

    //Face towards the player
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}

//Otherwise
else {

    //Inherit event
    event_inherited();    
    
    //If jumping out
    if (ready == 1) {
		
		//If there's no gravity
	    if (yadd == 0) {
        
	        //Start moving
	        alarm[10] = 2;
        
	        //Perform default step event
	        ready = 2;
        
	        //Set depth
	        depth = -2;
	    }
		else
			yadd = 0.15;
	}
    
    //Otherwise, if it can move
    else if (ready == 2) {
            
        //Face towards direction
        if (xspeed > 0)
            xscale = 1;
        else if (xspeed < 0)
            xscale = -1;
    }
}
