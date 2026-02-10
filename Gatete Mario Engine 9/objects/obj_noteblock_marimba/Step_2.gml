/// @description Set block offset

//Do not move if the block has been hit
if (ready == 0) {

	//If Mario does exist
	if (instance_exists(obj_mario)) {
	
		//If Mario is on this block, move the block it down
		if (collision_rectangle(bbox_left, bbox_top-3, bbox_right, bbox_top, obj_mario, 0, 0)) {
	
			yoffset++;
			if (yoffset > 3)
				yoffset = 3;
		}
	
		//Otherwise, move the block up
		else {
	
			yoffset--;
			if (yoffset < 0)
				yoffset = 0;
		}
	}

	//Otherwise
	else {

		yoffset--;
		if (yoffset < 0)
			yoffset = 0;
	}
}