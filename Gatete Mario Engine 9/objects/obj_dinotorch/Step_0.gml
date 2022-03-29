/// @description Dino Torch logic

//Inherit the parent event
event_inherited();

#region LOGIC

	if (sprite_index != spr_dinotorch_blow)
		turn_toward = -1;
	else
		turn_toward = 0;
#endregion

#region ANIMATION

	//If not blowing fire
	if (sprite_index != spr_dinotorch_blow) 
	&& (xspeed != 0) {

	    if (yadd == 0)
	        image_speed = 1;
	    else {
    
	        image_speed = 0;
	        image_index = 0;
	    }
	}
#endregion

//Face towards direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;