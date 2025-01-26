/// @description Kill Mario if the player gave up

//If the player gave up
if (kill_me == 1) {
			
	with (obj_mario) {
				
		instance_create_depth(x, y, depth, obj_mario_dead);
		instance_destroy();
		exit;  
	}
}