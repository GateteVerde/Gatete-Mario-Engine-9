/// @description Insta-kill Mario

//Check for Mario
var mario = collision_rectangle(bbox_left - 1, bbox_top -1, bbox_right + 1, bbox_bottom + 1, obj_mario, 0, 0);

//If Mario is on this platform
if (mario) {
	
	//If Mario is not invulnerable
	if (mario.invulnerable == false) {

		//Kill Mario instantly
		with (instance_create_depth(mario.x, mario.y, -5, obj_mario_dead)) {
		
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
	
		//Destroy
		with (mario) instance_destroy();
	}
}