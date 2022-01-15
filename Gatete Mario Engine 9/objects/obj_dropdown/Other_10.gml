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
		&& (bbox_bottom < semisolid.yprevious+5) {
		
			//Snap above the semisolid
			y = semisolid.bbox_top-16;
	
			//Destroy
			instance_destroy();
		}	
	}

	///Destroy in contact with water or a slope
	if (obj_mario.swimming == true)
	|| (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
		instance_destroy();

#endregion