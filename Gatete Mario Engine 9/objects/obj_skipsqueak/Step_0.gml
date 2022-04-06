/// @description Skipsqueak logic

//Inherit the parent event
event_inherited();

#region LOGIC

	//If Mario does exist
	if (instance_exists(obj_mario)) {

		//If this enemy is not jumping and Mario jumped
		if (jumping == 0)
		&& (obj_mario.isjump == 1) {
		
			//Set the jumping sprite
			sprite_index = (object_index == obj_skipsqueak_spiny) ? spr_skipsqueak_spiny_jump : spr_skipsqueak_jump;
			
			//Prepare to jump
			jumping = 1;
			
			//Hop after one quarter of a second
			alarm[0] = 15;
		}
		
		//Otherwise, if the enemy landed
		else if ((yadd == 0) && (jumping == 2)) {
			
			//Set the default sprite
			sprite_index = (object_index == obj_skipsqueak_spiny) ? spr_skipsqueak_spiny : spr_skipsqueak;
			
			//Reset jump
			if (obj_mario.state != playerstate.jump)
				jumping = 0;
		}
	}
	
	//Gravity
	yadd = (swimming) ? 0.025 : 0.1;
#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;
