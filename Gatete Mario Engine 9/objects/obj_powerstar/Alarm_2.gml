/// @description Leave a trail

alarm[2] = 4;
if (image_alpha == 1) 
&& (sprite_index == spr_powerstar) {
	
	with (instance_create_depth(x - 12 + random(24), y - 4 + random(24), -6, obj_sparkle)) {

		sprite_index = spr_sparkle_b;
		shrink_rate = 0.0324;
	}
}