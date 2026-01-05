/// @description Manage platform movement

#region Block collision

	//If none of the blocks was hit
	if (block_ready == 0) {
	
		//If Mario collides with the left block from below
		if (collision_rectangle(x, y+15, x+15, y+19, obj_mario, 0, 0)) {
		
			//Set up offset for the left block
			block_offset_l = -2;
			
			//Bump the block
			block_ready = 1;
		}
		
		//Otherwise, if Mario collides with the right block from below
		else if (collision_rectangle(x+16, y+15, x+31, y+19, obj_mario, 0, 0)) {
		
			//Set up offset for the left block
			block_offset_r = -2;
			
			//Bump the block
			block_ready = 1;			
		}
	}
	
	//Otherwise, if the block is moving up
	else if (block_ready == 1) {
	
		//If the left block was the one bumped
		if (block_offset_l < 0) {
		
			//Move it up
			block_offset_l -= 2;
			if (block_offset_l < -8)
				block_ready = 2;
		}
		
		//Otherwise, if the right block was the one bumped
		else if (block_offset_r < 0) {
		
			//Move it up
			block_offset_r -= 2;
			if (block_offset_r < -8)
				block_ready = 2;
		}
	}
	
	//Otherwise, if the block is moving down
	else if (block_ready == 2) {

		//Left Block
		if (block_offset_l > 0) {
		
			block_offset_l = 0;
			block_ready = 3;
		}
		
		//Right block
		else if (block_offset_r > 0) {
		
			block_offset_r = 0;
			block_ready = 3;
		}
		
		//Change offset for both blocks
		if (block_offset_l < 0) then block_offset_l += 2;
		if (block_offset_r < 0) then block_offset_r += 2;
	}
#endregion

//If the platform is not frozen
if (freeze == false) {

	//Time it
	mytimer += 0.495;
	angle = cos(mytimer*0.0495)*(pi/2);

	//Set the position of the block
	x = myx-sin(angle)*distance;
	y = myy+cos(angle)*distance;
}