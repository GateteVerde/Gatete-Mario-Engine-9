/// @description Nipper logic

//Inherit event
event_inherited();

#region LOGIC

	//If there's no gravity
	if (yadd == 0) {

	    //If Mario does exist
	    if (instance_exists(obj_mario)) {
    
	        //If Mario is nearby, jump
	        if (obj_mario.x > x-32)
	        && (obj_mario.x < x+32) 
	        && (obj_mario.y < y)
	            yspeed = -3;
	    }
    
	    //Set default sprite
	    sprite_index = spr_nipper;
	}

	//Otherwise, set jump frame
	else
	    sprite_index = spr_nipper_jump;
#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;
