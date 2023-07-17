/// @description Leave a trail

alarm[0] = 4;
with (instance_create_depth(x-8 + random(16), y + random(16), -1, obj_sparkle)) {
	
	if (global.player == 0)
		sprite_index = spr_sparkle_b;
	else
		sprite_index = spr_sparkle_f;
}