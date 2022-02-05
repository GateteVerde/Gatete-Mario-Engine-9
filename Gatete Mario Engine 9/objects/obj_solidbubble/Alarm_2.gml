/// @description Spawn item

//Reward an item
if (ready2 == 3) {

	//If the bubble does not have a star coin
	if (sprout < 3) {
	
		//Switch based on item
		switch (sprout) {
		
			//Mushroom
			case (0): {
			
				with (instance_create_depth(x, y-16, -2, obj_mushroom)) {
				
					yspeed = -6;
					if (!instance_exists(obj_mario))
					|| (obj_mario.x < x)
						xspeed = 1;
					else
						xspeed = -1;
				}
			} break;
			
			//1-UP
			case (1): {
			
				with (instance_create_depth(x, y-16, -2, obj_1up)) {
				
					yspeed = -6;
					if (!instance_exists(obj_mario))
					|| (obj_mario.x < x)
						xspeed = 1;
					else
						xspeed = -1;
				}
			} break;
			
			//Poison
			case (2): {
			
				with (instance_create_depth(x, y-16, -2, obj_poison)) {
				
					yspeed = -6;
					if (!instance_exists(obj_mario))
					|| (obj_mario.x < x)
						xspeed = 1;
					else
						xspeed = -1;
				}
			} break;
		}
	}
	
	//Otherwise, if the bubble holds a star coin
	else if (sprout == 3) {
	
		//If this coin has not been collected before
		if (ds_map_find_value(global.sc[sc_type], global.level) <> 1) {
		
			//Create the star coin
			with (instance_create_depth(x, y-16, 9, obj_coin_star)) {
			
				//Set the star coin type
				type = other.sc_type;
				
				//Motion
				ready = 1;
				yspeed = -4;
				alarm[0] = 480;
				alarm[1] = 600;
				
				//Set the sprite
				if (ds_map_find_value(global.sc[type], global.level) == 3) {
					
					sprite_index = spr_coin_star_get;
					alarm[2] = -1;
				}
			}
		}
	}

	//Destroy
	instance_destroy();
}