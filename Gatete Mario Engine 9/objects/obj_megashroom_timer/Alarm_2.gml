/// @description Leave a trail

//If the player does exist.
if (instance_exists(obj_mario)) {
	
    if (mask_index == spr_mask_mario_mega) {
    
        with (instance_create_depth(x - 20 + random(round(40)), y + random_range(-80, 16), -6, obj_sparkle)) {
        
			sprite_index = spr_sparkle_star;
			shrink_rate = 0.0324;
            image_speed = 0;
			image_index = choose(0, 1, 2, 3);
        }
    }
}

//Repeat
if (alarm[0] > 120)
    alarm[2] = 3;
else
    alarm[2] = 6;