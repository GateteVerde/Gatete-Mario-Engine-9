/// @description Leave a trail

alarm[0] = 1;
with (instance_create_depth(x - (12 * sign(xspeed)), y - random_range(-4, 4), -6, obj_smoke))
	sprite_index = spr_smoke_c;