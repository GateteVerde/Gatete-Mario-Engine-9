/// @description Check if Mario is nearby

//If Mario does not exist
if (!instance_exists(obj_mario)) {

	alarm[0] = 1;
	exit;
}

//Otherwise
else {

	//If Mario is nearby
	if (obj_mario.x > bbox_left-48)
	&& (obj_mario.x < bbox_right+48) {
	
		//If the chuck is not ready
		if (ready == 0) {
		
			//Set sprite
			sprite_index = spr_bouncinchuck;
			
			//Set frame
			image_speed = 0;
			image_index = 1;
			
			//Ready
			ready = 1;
			
			//Manage offset
			alarm[1] = 1;
			
			//Split into 3 chucks
			alarm[2] = 60;
		}
	}
	
	//Otherwise
	else {
	
		alarm[0] = 1;
		exit;
	}
}