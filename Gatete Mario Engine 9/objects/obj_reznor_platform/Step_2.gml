/// @description Platform logic

//Inherit the parent event
event_inherited();

#region BLOCK BUMPING

	//If none of the blocks was hit
	if (block_ready == 0) {
	
		//If Mario collides with the left block from below
		if (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+2, obj_mario, 0, 0)) {
		
			//Set up offset for the left block
			block_offset = -2;
			
			//Bump the block
			block_ready = 1;
		}
	}
	
	//Otherwise, if the block is moving up
	else if (block_ready == 1) {
	
		//If the left block was the one bumped
		if (block_offset < 0) {
		
			//Move it up
			block_offset -= 2;
			if (block_offset < -8)
				block_ready = 2;
		}
	}
	
	//Otherwise, if the block is moving down
	else if (block_ready == 2) {
		
		//Move block down
		block_offset += 2;
		
		//Allow block bump
		if (block_offset > 0) {
		
			block_offset = 0;
			block_ready = 0;
		}			
	}
#endregion