/// @description Leave a trail

alarm[2] = 8;
with (instance_create_depth(x-16 + random(32), y-16 + random(32), -6, obj_sparkle)) {

	sprite_index = spr_sparkle_b;
	shrink_rate = 0.0324;
}