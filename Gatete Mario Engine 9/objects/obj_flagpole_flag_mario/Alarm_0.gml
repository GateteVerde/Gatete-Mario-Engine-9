/// @description Leave a trail

alarm[0] = 8;
with (instance_create_depth(x + random(27), y-11 + random(27), -6, obj_sparkle)) {

	sprite_index = spr_sparkle_b;
	shrink_rate = 0.0324;
}