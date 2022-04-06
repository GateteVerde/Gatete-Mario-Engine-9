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
			toss = 0;
	        alarm[0] = 60+random(round(60));
	    }
	}
	
	//Otherwise, if the Ninji is jumping and he can throw Kunais
	else {
	
		if (toss == 1)
		&& (yspeed > 0) {
		
			//End toss
			toss = 2;
			
			//If Mario does not exist or it's at the left
			if (!instance_exists(obj_mario))
			|| (obj_mario.x < x) {
			
				with (instance_create_depth(x, y+8, -3, obj_ninji_kunai)) motion_set(205, 2);
				with (instance_create_depth(x, y+8, -3, obj_ninji_kunai)) motion_set(225, 2);
				with (instance_create_depth(x, y+8, -3, obj_ninji_kunai)) motion_set(245, 2);
			}
			
			//Otherwise, if Mario is at the right
			else if (obj_mario.x > x) {

				with (instance_create_depth(x, y+8, -3, obj_ninji_kunai)) motion_set(295, 2);
				with (instance_create_depth(x, y+8, -3, obj_ninji_kunai)) motion_set(315, 2);
				with (instance_create_depth(x, y+8, -3, obj_ninji_kunai)) motion_set(335, 2);
			}
		}
	}
#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;