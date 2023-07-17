/// @description Generate gold effects

alarm[2] = 8;
if (global.powerup == cs_gold) {

	//If Mario is not crouched down
	if (crouch == false) {
		
		with (instance_create_depth(x-8 + random(16), y - 16 + random(32), -6, obj_sparkle)) {
			
			if (global.player == 0)
				sprite_index = spr_sparkle_b;
			else
				sprite_index = spr_sparkle_f;
		}
	}
	
	//Otherwise
	else {
		
		with (instance_create_depth(x-8 + random(16), y + random(16), -6, obj_sparkle)) {
			
			if (global.player == 0)
				sprite_index = spr_sparkle_b;
			else
				sprite_index = spr_sparkle_f;
		}
	}
}