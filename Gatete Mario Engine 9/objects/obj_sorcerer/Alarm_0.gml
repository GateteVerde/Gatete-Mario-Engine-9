/// @description Generate Sparkles

alarm[0] = 4;
with (instance_create_depth(x + random(round(16)), y + random(round(16)), -6, obj_sparkle)) {
        
	sprite_index = spr_sparkle_star;
	shrink_rate = 0.075;
    image_speed = 0;
	image_index = choose(0, 1, 2, 3);
}