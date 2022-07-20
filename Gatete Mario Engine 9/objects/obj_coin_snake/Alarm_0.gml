/// @description Make objects and change direction

//Snap to grid
move_snap(16, 16);

#region DIRECTION

	switch (nextdir) {
	
		//0
		case (0): {
		
			//If the coin is not moving to the left
			if (xspeed < 0)
			exit;
			
			//Set new motion
			xspeed = 1;
			yspeed = 0;
		} break;
		
		//90
		case (90): {
		
			//If the coin is not moving down
			if (yspeed > 0)
			exit;
			
			//Set new motion
			xspeed = 0;
			yspeed = -1;
		} break;
		
		//180
		case (180): {
		
			//If the coin is not moving to the right
			if (xspeed > 0)
			exit;
			
			//Set new motion
			xspeed = -1;
			yspeed = 0;
		} break;
		
		//270
		case (270): {
		
			//If the coin is not moving up
			if (yspeed < 0)
			exit;
			
			//Set new motion
			xspeed = 0;
			yspeed = 1;
		} break;
	}
#endregion

//If empty blocks needs to be created, create them
if (sprite_index == spr_brick) {
	
    with (instance_create_depth(x, y, 0, obj_brick)) {
	
		//Hereby frame from a existing brick
		if (instance_exists(obj_brick))
			image_index = obj_brick.image_index;
	}
}
    
//Otherwise
else if (!position_meeting(x+8, y+8, obj_coin)) {

    with (instance_create_depth(x, y, 0, obj_coinchange)) {
        
        //Turn into a coin
        alarm[0] = 16;
        
        //Make visible
        visible = 1;
        
        //Hereby frame from a existing coin
        if (instance_exists(obj_coin))
            image_index = obj_coin.image_index;
    }
}

//Make another object
alarm[0] = 16;

//Destroy on contact with coins, solids or semisolids
if ((xspeed > 0) && ((position_meeting(x + 16, y + 8, obj_coin)) || (position_meeting(x + 16, y + 8, obj_solid))))
|| ((yspeed < 0) && ((position_meeting(x + 8, y - 1, obj_coin)) || (position_meeting(x + 8, y - 1, obj_solid))))
|| ((xspeed < 0) && ((position_meeting(x - 1, y + 8, obj_coin)) || (position_meeting(x - 1, y + 8, obj_solid))))
|| ((yspeed > 0) && ((position_meeting(x + 8, y + 16, obj_coin)) || (position_meeting(x + 8, y + 16, obj_semisolid))))
	instance_destroy();