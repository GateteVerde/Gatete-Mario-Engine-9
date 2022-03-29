/// @description Dino Rhino logic

//Inherit the parent event
event_inherited();

#region ANIMATION

	if (yadd == 0)
	    image_speed = 1;
	else {
    
	    image_speed = 0;
	    image_index = 0;
	}
#endregion

//Face towards direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;