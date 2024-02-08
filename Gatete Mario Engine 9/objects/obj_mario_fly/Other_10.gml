/// @description General collision

#region HORIZONTAL COLLISION

	//If moving right and there's a wall in position
	if (xscale > 0)
	&& (collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom-4, obj_solid, 1, 0)) {
		
		//Stop horizontal movement
		xspeed = 0;
		at_wall = true;
		
		//Prevent Mario from getting embed on the wall
		while (collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-4, obj_solid, 1, 0))
		&& (!collision_point(x, bbox_top+4, obj_solid, 0, 0))
			x--;
	}
	
	//Otherwise, if moving left
	else if (xscale < 0)
	&& (collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom-4, obj_solid, 1, 0)) {
		
		//Stop horizontal movement
		xspeed = 0;
		at_wall = true;
		
		//Prevent Mario from getting embed on the wall
		while (collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-4, obj_solid, 1, 0))
		&& (!collision_point(x, bbox_top+4, obj_solid, 0, 0))
			x++;
	} else

		at_wall = false;

	#endregion

#region VERTICAL COLLISION
	
	//If moving upwards
	if (yspeed < 0) 
	&& (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_solid, 1, 0)) {
	
		//Prevent the player from getting stuck on a ceiling when jumping/climbing
		if (yspeed < 0) {
			
			while (collision_rectangle(bbox_left, bbox_top+1, bbox_right, bbox_top+1, obj_solid, 1, 0))
				y ++;
		}
		
		//Stop vertical movement
		yspeed = 0;
		
	}
	
	//Prevent the player from overlappin' the ceiling
	if (yspeed < 0)	
		while (collision_rectangle(bbox_left+1, bbox_top+1, bbox_right-1, bbox_top+1, obj_solid, 1, 0))
			y ++;

	//If moving down
	if (yspeed >= 0) {

		//Check for any nearby ground collision
		var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
		//If there's ground below and Mario is not moving upwards
		if (semisolid)
		&& (bbox_bottom < semisolid.yprevious+5)
		&& (!collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+4, obj_slopeparent, 1, 0)) {
		
			//Snap above the semisolid
			y = semisolid.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		}	
	}

	//Embed into the slope to ensure correct slope mechanics
	if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+4, obj_slopeparent, 1, 0))
	&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_slopeparent, 1, 0))
	&& (yadd == 0)
	    y += 4;

	///Handle slope collisions
	if (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
	&& (!collision_rectangle(bbox_left, bbox_bottom-8, bbox_right, bbox_bottom-8, obj_slopeparent, 1, 0)) {

		//If Mario is moving down onto a slope
		if (yspeed >= 0) {

		    //Stop vertical movement
		    yadd = 0;
			yspeed = 0;
		}

		//Prevent NPC from getting embed inside a slope
		if (yspeed > -0.85)
		    while (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
		        y--;
	}

#endregion