/// @description Create sparkle effects

//Repeat the process
alarm[1] = 2;

//If scaled up
if ((scale == 1) && (alpha > 1)) {

	with (instance_create_depth(x - 16 + random(32), y + random(13), -7, obj_sparkle)) {
	
		sprite_index = spr_sparkle_b;
		shrink_rate = 0.05;	
	}
}