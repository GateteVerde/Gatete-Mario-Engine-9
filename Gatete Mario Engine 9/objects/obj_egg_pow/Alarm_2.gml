/// @description Create a powerup based on sprite

switch (sprite_index) {

	//Green Egg
	case (spr_egg): {
	
		with (instance_create_depth(x, y, -2, obj_mushroom)) {
		
			move_after_landing = 1;
			yspeed = (place_meeting(x, y + 8, obj_swim)) ? -2 : -4;
		}
	} break;
	
	//Red Egg
	case (spr_egg_r): {
	
		with (instance_create_depth(x, y, -2, obj_fireflower))
			yspeed = (place_meeting(x, y + 8, obj_swim)) ? -2 : -4;
	} break;
	
	//Yellow Egg
	case (spr_egg_y): {
	
		with (instance_create_depth(x, y, -2, obj_starman)) {
		
			move_after_landing = 1;
			yspeed = (place_meeting(x, y + 8, obj_swim)) ? -2 : -4;
		}
	} break;
	
	//Blue Egg
	case (spr_egg_b):
		instance_create_depth(x, y, 10, obj_feather_sprout);
		break;
		
	//Teal Egg
	case (spr_egg_t): {
	
		with (instance_create_depth(x, y, -2, obj_iceflower))
			yspeed = (place_meeting(x, y + 8, obj_swim)) ? -2 : -4;
	} break;
	
	//Pink Egg
	case (spr_egg_p): {
	
		with (instance_create_depth(x, y, -2, obj_carrot))
			yspeed = (place_meeting(x, y + 8, obj_swim)) ? -2 : -4;
	} break;
}

//Destroy
instance_destroy();