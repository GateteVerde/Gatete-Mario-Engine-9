/// @description Leave a trail

//If the player does exist.
if (instance_exists(obj_mario)) {
	
	//If the player is tiny
	if (mask_index == spr_mask_mario_tiny) {
    
        with (instance_create_depth(x - 8 + random(round(16)), y + random_range(0, 16), -6, obj_sparkle)) {
        
			sprite_index = spr_sparkle_star;
			shrink_rate = 0.0324;
            image_speed = 0;
			image_index = choose(0, 1, 2, 3);
        }
    }

    //Otherwise, if the player is small or is crouched down.
    else if (mask_index == spr_mask_mario) 
	|| (mask_index == spr_mask_mario_shell) {
    
        with (instance_create_depth(x - 8 + random(round(16)), y + random_range(0, 16), -6, obj_sparkle)) {
        
			sprite_index = spr_sparkle_star;
			shrink_rate = 0.075;
            image_speed = 0;
			image_index = choose(0, 1, 2, 3);
        }
    }
    
    //Otherwise, if the player is big
    else if (mask_index == spr_mask_mario_big) {
    
        with (instance_create_depth(x - 8 + random(round(16)), y + random_range(-6, 16), -6, obj_sparkle)) {
        
			sprite_index = spr_sparkle_star;
			shrink_rate = 0.075;
            image_speed = 0;
			image_index = choose(0, 1, 2, 3);
        }
    }
}

//Repeat
if (obj_invincibility.alarm[0] > 120)
    alarm[3] = 1;
else
    alarm[3] = 4;