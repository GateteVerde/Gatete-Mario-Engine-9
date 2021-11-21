/// @description Generate a 1-UP mushroom

alarm[1] = 60;
with (instance_create_depth(x + 16, ystart, 10, obj_powerup_sprout)) {
	
	big = 2;
	sprite_index = spr_1up;
}