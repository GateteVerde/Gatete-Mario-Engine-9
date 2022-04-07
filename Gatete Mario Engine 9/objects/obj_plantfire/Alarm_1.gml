/// @description Leave Ice Trail

//IF this is a ice ball
if (sprite_index == spr_iceball) {

	instance_create_depth(x - 4 + random(8), y + random(8), -4, obj_sparkle);
	alarm[1] = 4;
}
