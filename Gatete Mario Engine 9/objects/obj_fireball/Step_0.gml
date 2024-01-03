/// @description Fireball logic

//Check previous horizontal speed
prevxspeed = xspeed;

//No swimming
swimming = false;

//Inherit the parent event
event_inherited();

#region GRAVITY

	if (global.fireballtype == 0) {

		//If there's no gravity
		if (yadd == 0) {

			yadd = 0;
			if (global.player == 0)
				yspeed = -2.5;
			else
				yspeed = -3.5;
		}
		else
			yadd = 0.25;
	}

	//Otherwise
	else {

		//If Mario is being controlled
		if (global.player == 0) {
		
			//If there's no gravity
			if (yadd == 0) {

				yadd = 0;
				if (global.player == 0)
					yspeed = -2.5;
				else
					yspeed = -3.5;
			}
			else
				yadd = 0.25;
		}
		
		//Otherwise, if Luigi is being controlled
		else {
			
			//If the fireball collides with a slope
			if (collision_rectangle(bbox_left-1, bbox_top-1, bbox_right+1, bbox_bottom+1, [obj_slopeparent, obj_slopeparent_ceiling], 1, 0)) {
			
				event_user(0);
				exit;
			}
		
			//Stop vertical movement
			yadd = 0;
			if (yspeed != 0)
				yspeed = 0;
		}
	}
#endregion

//Destroy if horizontal speed is not the same as prevxspeed
if (freeze == false)
&& (sign(xspeed) != sign(prevxspeed))
	event_user(0);