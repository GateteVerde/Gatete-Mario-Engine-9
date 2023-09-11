/// @description Hoppycat logic

//Inherit the parent event
event_perform_object(obj_physicsparent, ev_step, ev_step_normal);

#region LOGIC

	//If Mario does exist
	if (instance_exists(obj_mario)) {

		//If this enemy is not jumping and Mario jumped
		if (jumping == 0)
		&& (obj_mario.isjump == 1) {
			
			//Prepare to jump
			jumping = 1;
			
			//Set the vertical speed
			yspeed = (swimming) ? -1 : -4;
			y--;
		}
		
		//If the enemy landed do prevent jump until Mario lands
		else if ((yadd == 0) && (jumping > 0)) {
			
			//If falling
			if (jumping == 1)
				jumping = 2;
				
			//Otherwise, if Mario did landed
			else if ((jumping == 2) && (obj_mario.state < playerstate.jump))
				jumping = 0;
		}			
	}
	
	//Gravity
	yadd = (swimming) ? 0.025 : 0.1;
	
	//Cap vertical speed
	if (swimming == 0)
	&& (yspeed > 3)
		yspeed = 3;
	
	else if (swimming == 1)
	&& (yspeed > 0.75)
		yspeed = 0.75;
	
#endregion

#region ANIMATION

	//If not jumping
	if (jumping != 1) {
	
		//Set the default sprite
		sprite_index = spr_hoppycat;
		
		//Do not animate
		image_speed = 0;
		image_index = 0;
	}
	
	//Otherwise, if jumping
	else {
		
		//Set the jumping sprite
		sprite_index = spr_hoppycat_jump;
		
		//Animate
		image_speed = 1;
		
		//If moving up
		if (yspeed < 0)
			image_index = 0;
	}
#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;
