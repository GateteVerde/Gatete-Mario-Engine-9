/// @description Autobomb logic

//Inherit the parent event
event_inherited();

#region RIDER LOGIC

	//If the rider does exist
	if (instance_exists(rider)) {
    
	    //Keep the rider active
	    instance_activate_object(rider);
    
	    //Make the rider hereby the xscale
	    rider.xscale = xscale;
    
	    //Snap to position.
	    rider.x = x;
	    rider.y = bbox_top-16;
	}
	
#endregion

//Face towards direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;