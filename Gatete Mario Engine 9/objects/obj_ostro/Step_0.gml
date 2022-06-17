/// @description Ostro logic

//Inherit the parent event
event_inherited();

#region LOGIC

	if (yadd == 0) {
	
		//Set the vertical speed
		yspeed = -1.5;
		y--;
		
		//Change frame
		image_index = !image_index;
	}
#endregion

#region RIDER LOGIC

	//If the rider does exist
	if (instance_exists(rider)) {
    
	    //Keep the rider active
	    instance_activate_object(rider);
    
	    //Make the rider hereby the xscale
	    rider.xscale = xscale;
    
	    //Snap to position.
	    rider.x = x;
	    rider.y = y-16;
	}
	
#endregion

//Face towards direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;