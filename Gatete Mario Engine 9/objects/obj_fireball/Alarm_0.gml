/// @description Leave a trail

alarm[0] = 2;
with (instance_create_depth(x, y+4, -1, obj_smoke)) {
	
	switch (global.player) {
		
		//Mario
		case (0): sprite_index = spr_cinder; break;
		
		//Luigi
		case (1): sprite_index = spr_cinder_l; break;
	}
}