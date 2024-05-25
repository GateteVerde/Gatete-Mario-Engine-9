/// @description Leave a trail

//Repeat the process
alarm[2] = 8;

//If the coin is visible
if (visible == 1) {
	
	with (instance_create_depth(x-16 + random(32), y-16 + random(32), -6, obj_sparkle)) {

		sprite_index = spr_sparkle;
		shrink_rate = 0.0324;
	}
}