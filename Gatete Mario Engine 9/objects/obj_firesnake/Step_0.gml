/// @description Fire Snake logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//Wall / Ceiling collision
	ai_npc_wall(1);
	ai_npc_ceiling(1);
	
	//If the fire snake is not jumping downwards
	if (ready == 0) {
	
		//Handle position when in-ground
		if (yspeed >= 0) {

			//Check for a conveyor
			var conveyor = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_conveyorparent, 0, 0);
		
			//If there's a conveyor
			if (conveyor)
			&& (conveyor.image_speed != 0) {
		
				//If the conveyor is moving and there's not solid on the way
				if ((conveyor.image_speed < 0) && (!collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 0, 0)))
				|| ((conveyor.image_speed > 0) && (!collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-1, obj_solid, 0, 0)))
					x += conveyor.image_speed;
			}
	
			//Check for any nearby ground collision
			var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
			//If there's ground below and Mario is not moving upwards
			if (semisolid)
			&& (bbox_bottom < semisolid.yprevious + 5)
				y = semisolid.bbox_top - floor(sprite_height-(sprite_get_yoffset(sprite_index)));
		}

		//Slope Collision
		slope_collision();

		//Check if there's a semisolid
		if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
		&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_semisolid, 0, 0)))
		|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)) {
	
			//If moving down
			if (yspeed > 0) {
			
				yadd = 0;
				yspeed = 0;
			}
		}

		//Otherwise
		else {
			
			//Gravity
			yadd = 0.1;
			
			//Cap vertical speed
			if (yspeed > 2)
				yspeed = 2;
		}
	}
	
	//Otherwise
	else {
		
		//Gravity
		yadd = 0.1;
		
		//Cap vertical speed
		if (yspeed > 2)
			yspeed = 2;
	}
#endregion

//Set up the facing direction if in ground and make it jump again
if (yadd == 0) {

    //If the object jumped
    if (jumping == 2) {
    
        //Stop horizontal movement
        xspeed = 0;
    
        //End jump
        jumping = 0;
        
        //Jump again
        alarm[0] = 60;
    }

    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}

//Otherwise, end jump
else {

    if (jumping == 1) && (yspeed > 0)
        jumping = 2;
}

//Allow jumpthrough
if ((ready == 1) && (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0))) ready = 2;
if ((ready == 2) && (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0))) ready = 0;
