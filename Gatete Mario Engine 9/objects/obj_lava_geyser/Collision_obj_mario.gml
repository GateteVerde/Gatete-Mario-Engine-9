/// @description Insta-kill Mario

//Create Mario death object
with (instance_create_depth(other.x, other.y, -5, obj_mario_dead)) {

	//Set gray palette
	image_blend = c_gray;
	alarm[2] = 1;
					
	//If health mode is activated
	if (global.hp_mode == 1)
		sprite_index = spr_mario_dead_big;
				
	//Otherwise
	else {
			
		if (global.powerup == cs_tiny)
			sprite_index = spr_mario_dead_tiny;
		else
			sprite_index = spr_mario_dead_big;
	}
}