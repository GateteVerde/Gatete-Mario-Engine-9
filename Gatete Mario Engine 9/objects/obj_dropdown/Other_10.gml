/// @description General collision

#region HORIZONTAL COLLISION

	//If moving right and there's a wall in position
	if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed, bbox_top+4, bbox_left+xspeed, bbox_bottom-1, obj_solid, 1, 0)))
	|| ((xspeed > 0) && (collision_rectangle(bbox_right+xspeed, bbox_top+4, bbox_right+xspeed, bbox_bottom-1, obj_solid, 1, 0)))
		instance_destroy();
#endregion

#region VERTICAL COLLISION

	//If moving down
	if (yspeed >= 0) {

		//Check for any nearby ground collision
		var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
		//If there's ground below and Mario is not moving upwards
		if (semisolid)
		&& (bbox_bottom < semisolid.yprevious+5)
		&& (!collision_rectangle(x-1, bbox_bottom+1, x+1, bbox_bottom+4, obj_slopeparent, 1, 0)) {
		
			//Snap above the semisolid
			y = semisolid.bbox_top-16;
	
			//Destroy
			instance_destroy();
		}	
	}
	
	//Embed into the slope to ensure correct slope mechanics
	if (collision_rectangle(x-1, bbox_bottom, x+1, bbox_bottom+4, obj_slopeparent, 1, 0))
	&& (!collision_rectangle(x-1, bbox_bottom-4, x+1, bbox_bottom-4, obj_slopeparent, 1, 0))
	&& (yadd == 0)
	    y += 4;

	///Handle slope collisions
	if (collision_rectangle(x-1, bbox_bottom-4, x+1, bbox_bottom, obj_slopeparent, 1, 0))
	&& (!collision_rectangle(x-1, bbox_bottom-8, x+1, bbox_bottom-8, obj_slopeparent, 1, 0)) {

		//If Mario is moving down onto a slope
		if (yspeed >= 0) {

		    //Stop vertical movement
		    yadd = 0;
			yspeed = 0;
		}

		//Prevent NPC from getting embed inside a slope
		if (yspeed > -0.85)
		    while (collision_rectangle(x-1, bbox_bottom-4, x+1, bbox_bottom, obj_slopeparent, 1, 0))
		        y--;
	}
	
	//Destroy if Mario is swimming
	if (obj_mario.swimming == true)
		instance_destroy();

#endregion