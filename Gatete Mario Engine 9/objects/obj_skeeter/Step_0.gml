/// @description Skeeter logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//Wall collision
	#region WALL COLLISION
	
		//Check for a platform
		platform_l = collision_rectangle(bbox_left-16+xspeed, bbox_top+1, bbox_left-16, bbox_bottom-4, obj_platformparent, 1, 0);
		platform_r = collision_rectangle(bbox_right+16, bbox_top+1, bbox_right+16+xspeed, bbox_bottom-4, obj_platformparent, 1, 0);
	
		//If moving right and there's a wall in position
		if (xspeed > 0)
		&& ((collision_rectangle(bbox_right+16, bbox_top+1, bbox_right+16+xspeed, bbox_bottom-4, obj_solid, 1, 0))
		|| ((platform_r) && (platform_r.issolid == true))) {
		
			//Stop horizontal movement or reverse movement
			xspeed = 0;
		
			//Prevent NPC from getting embed on the wall
			while (collision_rectangle(bbox_right+16, bbox_top+1, bbox_right+16, bbox_bottom-4, obj_solid, 1, 0))
				x--;
		}
	
		//Otherwise, if moving left
		else if (xspeed < 0)
		&& ((collision_rectangle(bbox_left-16+xspeed, bbox_top+1, bbox_left-16, bbox_bottom-4, obj_solid, 1, 0))
		|| ((platform_l) && (platform_l.issolid == true))) {
		
			//Stop horizontal movement or reverse movement
			xspeed = 0;
		
			//Prevent NPC from getting embed on the wall
			while (collision_rectangle(bbox_left-16, bbox_top+1, bbox_left-16, bbox_bottom-4, obj_solid, 1, 0))
				x++;
		}	
	#endregion
	
	#region WATER COLLISION
	
		//Check for a water surface
		var ws = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_swim, 0, 0);
		
		//If there's water and Mario is tiny and not jumping
		if (ws)
		&& (bbox_bottom < ws.yprevious+5) {

			//Snap above the semisolid
			y = ws.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		}
		
		//Otherwise
		else {
		
			yadd = 0.2;
			if (yspeed > 4)
				yspeed = 4;
		}
	#endregion
	
	//If moving horizontally
	if (ready == 1) {
	
		//Slowdown
		xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
		
		//If not longer moving
		if (abs(xspeed) < 0.05) {
	
			//Stop horizontal movement
			xspeed = 0;
			
			//Do not move
			ready = 0;
		
			//Move again
			alarm[0] = round(random_range(60, 120));
		}
	}
#endregion

#region ANIMATION

	//If moving horizontally
	if (abs(xspeed) > 0) {

		image_speed = 0;
		image_index = 1;
	}

	//Otherwise
	else {
		
		if (alarm[0] < 60)
			image_speed = 1;
		else {
			
			image_speed = 0;
			image_index = 1;
		}
	}
#endregion

//Face towards direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
