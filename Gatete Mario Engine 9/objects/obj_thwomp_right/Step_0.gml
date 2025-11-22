/// @description Thwomp logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	xspeed += yadd;
}

#region LOGIC

	//Fall down if Mario gets close
	if (ready == 0)
	&& (instance_exists(obj_mario))
	&& (collision_rectangle(bbox_right, bbox_top, bbox_right+128, bbox_bottom, obj_mario, 0, 0)) {
		
	    ready = 1;
		yadd = 0.15;
	}

	//Otherwise if falling, land on ground
	else if (ready == 1) {
    
		//Check for a solid or End modifier
		var mysolid = collision_rectangle(bbox_left, bbox_top, bbox_right+hspeed, bbox_bottom, obj_solid, 1, 0);
		var mylimit = collision_rectangle(bbox_left, bbox_top, bbox_right+hspeed, bbox_bottom, obj_endmarker, 1, 0);
		
		//If there's a solid on the way
		if (mysolid) {
		
			//Play 'Thud' sound
			audio_play_sound(snd_thud, 0, false);
			
			//Shake screen
	        shake_camera(6, ceil(audio_sound_length(snd_thud) * GAME_SPEED), true);    
        
	        //Change state
	        ready = 2;
			
			//Stop horizontal speed
			xspeed = 0;
        
			//Stop gravity
			yadd = 0;
        
	        //Create smoke effects
	        instance_create_depth(bbox_right, bbox_top, -6, obj_smoke);
	        instance_create_depth(bbox_right, bbox_bottom, -6, obj_smoke);
			
			//Snap to the right of the solid
			x = mysolid.bbox_left-14;
        
	        //Return to start position
	        alarm[0] = 60;
		}
		
		//Otherwise, if there's a end marker on the way
		else if (mylimit) {
			
			//Stop horizontal speed
			xspeed = 0;
        
			//Stop gravity
			yadd = 0;
			
			//Change state
	        ready = 2;
		
			//Snap to the right of the solid
			x = mylimit.bbox_left-14;
			
			//Return to start position
			alarm[0] = 60;
		}
				
		//Cap horizontal speed
		if (xspeed > 4)
			xspeed = 4;
	}

	//Otherwise if ascending and nearby the start point, stop.
	else if (ready == 3) && (x < xstart+1) {

	    //Change state
	    ready = 0;
    
	    //Stop vertical movement
	    xspeed = 0;
	    x = xstart;
	}
#endregion

//If not moving, check player position
if (ready == 0) {

    //If Mario does not exist
    if (!instance_exists(obj_mario))
    || (obj_mario.x > bbox_left)
        image_index = 0;
        
    //Otherwise
    else {
    
        //If Mario is pixels nearby, set peekin' pose
        if (obj_mario.x > bbox_right)
        && (obj_mario.x < bbox_right+192)
            image_index = 1;
        else
            image_index = 0;
    }
}

//Otherwise, if moving
else {

    //If moving up
    if (ready == 3)
        image_index = 0;
        
    //Otherwise, if falling down
    else
        image_index = 3;
}

//Always face right
xscale = 1;
