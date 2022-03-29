/// @description Ninji logic

//Inherit event
event_inherited();

#region LOGIC

	//Animate
	if (yadd == 0) {

	    //If jumping and moving down, wait until floor is reached
	    if (jumping == 1) {
    
	        image_index = 0;
	        jumping = 2;
	    }

		//End jump
	    else if (jumping == 2) {
        
	        jumping = 0;
	        alarm[0] = 60+random(round(60));
	    }
	}
#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;