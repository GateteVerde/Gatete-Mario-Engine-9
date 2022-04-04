/// @description Jump out of the pipe

//If the piranha plant is inside the pipe
if (ready == 0) {
	
	//If Mario does not exists, ignore this event
	if (!instance_exists(obj_mario)) {

		alarm[0] = 1;
		exit;
	}

	//If Mario does exists and is nearby, ignore this event
	else if ((obj_mario.x > bbox_left-32) && (obj_mario.x < bbox_right+32)) {

		alarm[0] = 1;
		exit;
	}
	
	//Set the vertical speed
	yspeed = -2;
}
