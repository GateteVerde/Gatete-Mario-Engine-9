/// @description Monty Mole logic

//Inherit event
event_inherited();

//If not charging at Mario
if (charge == 0) {

	//If the monty mole lands after jumping
	if (yadd == 0) 
	&& (jumping == 1) {
		
		//Allow jumping
		jumping = 0;
	
		//Jump again
		alarm[0] = 60;
		
		//Animate if not
		if (image_speed == 0)
			image_speed = 1;
	}
	
	//Face towards direction
	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
}

//Otherwise
else if (charge == 1) {
	
	//Previous xspeed
	prevxspeed = xspeed;
    
    //If there's no yadd
    if (yadd == 0) {
		
		//If the direction changed, speed up
	    if (xspeed != prevxspeed) {
    
	        xspeed = sign(xspeed)*1.5;
	        if (yadd == 0) {
        
	            yspeed = -1.5;
	            y--;
	        }
	    }
            
        //Follow Mario
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x) {
            
            xspeed -= 0.05;
            if (xspeed < -1.5)
                xspeed = -1.5;
        }
        else {
            
            xspeed += 0.05;
            if (xspeed > 1.5)
                xspeed = 1.5;
        }
    }

	//Face towards Mario
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
	    xscale = -1;
	else
	    xscale = 1;	
}
