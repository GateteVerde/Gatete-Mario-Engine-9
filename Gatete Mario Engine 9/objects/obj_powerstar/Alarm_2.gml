/// @description Leave a trail

alarm[2] = 8;
if (image_alpha == 1) 
&& (sprite_index == spr_powerstar) {
	
	with (instance_create_depth(x-8 + random(16), y + random(16), -6, obj_sparkle)) {

		sprite_index = spr_sparkle_b;
		shrink_rate = 0.0324;
	}
}