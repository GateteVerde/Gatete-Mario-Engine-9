/// @description Generate effect

//Generate effect
alarm[3] = 60 + random(round(120));

//But only if not falling
if (ready < 2) {

	with (instance_create_depth(x + random_range(6, 10), y + 30, -4, obj_sparkle)) {

		sprite_index = spr_bubble_tide;
		image_speed = 0;
		image_index = 0;
		gravity = 0.1;
		shrink_rate = 0.01;
	}
}