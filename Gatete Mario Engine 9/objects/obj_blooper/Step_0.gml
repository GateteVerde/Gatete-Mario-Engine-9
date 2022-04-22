/// @description Blooper logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//If Mario does exist
	if (instance_exists(obj_mario)) {

	    //If the blooper can swim upwards and it's below Mario.
	    if (!ready)
	    && (y > obj_mario.y+16) {
    
	        //Swim upwards.
	        ready = 1;
        
	        //Set gravity
	        yadd = 0;
        
	        //Sink slowly
	        alarm[0] = 40;
		
			//Set vertical speed
			yspeed = -3;
        
	        //If Mario is at the right
	        if (obj_mario.x > x)
				xspeed = 3;
		
			//Otherwise, if Mario is at the left
			else if (obj_mario.x < x)
				xspeed = -3;
	    }
	}

	//Slowdown if swimming
	if (ready == 1) {

	    //Slowdown
		xspeed = max(0,abs(xspeed)-0.1)*sign(xspeed);
		yspeed = max(0,abs(yspeed)-0.1)*sign(yspeed);
    
	    //If there's no speed
	    if (xspeed == 0) 
		&& (yspeed == 0) {
    
	        //Allow swim after a while
	        ready = 2;
	        alarm[0] = 40;
	    }
	}

	//Otherwise, apply gravity
	else if (ready != 1) {

	    //Enable gravity and cap vertical speed
	    yadd = 0.1;
	    if (yspeed > 0.5)
	        yspeed = 0.5;
	}

#endregion

#region PHYSICS
	
	//NPC Wall & Ceiling
	ai_npc_wall(0);
	ai_npc_ceiling(0);

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
#endregion

//Set frame
if (yspeed < 0)
    image_index = 0;
else
    image_index = 1;
