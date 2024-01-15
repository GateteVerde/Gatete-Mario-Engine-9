/// @description Generate effect

//Repeat the process
alarm[0] = 4;

//If not frozen
if (freeze == false) {

	//If the balloon boo is inhaling, create effect in front
	if (effect == 2) {

		//Create a effect that moves towards the boo
		var start_x = (xscale == 1) ? bbox_right + 48 : bbox_left - 48;
		var target_x = (xscale == 1) ? bbox_right - 16 : bbox_left + 16;
		
		//Generate effect
		with (instance_create_depth(start_x, (round(y + bbox_bottom) / 2) + random_range(-24, 24), -6, obj_smoke_fade)) {
		
			direction = point_direction(start_x, ystart, target_x, round(other.y + other.bbox_bottom) / 2);
			speed = random_range(0.5, 2);
			fade_rate = 0.03;
			image_xscale = random_range(0.5, 1);
			image_yscale = image_xscale;
			sprite_index = spr_boo_balloon_effect
		}
	}

	//Otherwise, create it on the rear
	else if (effect == 1) {
		
		//Point
		var point_x = (xscale == 1) ? bbox_left : bbox_right;

		//Generate effect
		with (instance_create_depth(point_x, round(y+bbox_bottom) / 2, -6, obj_smoke_fade)) {
	
			direction = (other.xscale == 1) ? random_range(150, 210) : random_range(-30, 30);
			speed = random_range(0.5, 2);
			fade_rate = 0.015;
			image_xscale = random_range(0.5, 1);
			image_yscale = image_xscale;
			sprite_index = spr_boo_balloon_effect;
		}
	}
}