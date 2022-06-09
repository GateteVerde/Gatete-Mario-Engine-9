/// @description Platform Thwomp logic

//Manage pseudo movement variables
if (freeze == false) {

	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//Fall down if Mario gets close
	if (ready == 0)
	&& (instance_exists(obj_mario))
	&& (obj_mario.x > bbox_left-32)
	&& (obj_mario.x < bbox_right+32)
	&& ((y < obj_mario.y) || (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top+1, obj_mario, 0, 0)))
		ready = 1;

	//Otherwise if falling, land on ground
	else if (ready == 1) {   
    
		#region MOVEMENT
	
			//Handle position when in-ground
			if (yspeed >= 0) {
	
				//Vspeed capacity
				yspeed = min(4 - (swimming * 2), yspeed);
	
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
			
				yadd = 0.2;
			}

			//Check for a nearby lava object
			var lava = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom+7, obj_lava, 1, 0);

			//If the NPC makes contact with lava
			if (lava) {
	
				//If this object is not a baburu shoe
				if (sprite_index != spr_shoe_baburu) {
	
					//Play 'Burn' sound
					audio_play_sound(snd_burn, 0, false);
		
					//Go *poof*
					instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -6, obj_smoke);
					with (instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -6, obj_smoke)) {
			
						sprite_index = spr_splash_lava;
					}
		
					//Destroy
					instance_destroy();
				}	
			}
		#endregion
    
		//When on ground
		if (yadd == 0) {
    
		    //Play 'Thud' sound
		    audio_play_sound(snd_thud, 0, false);
        
		    //Shake screen
		    shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);    
        
		    //Change state
		    ready = 2;
        
		    //Create smoke effects
		    instance_create_depth(bbox_left, bbox_bottom, -6, obj_smoke);
		    instance_create_depth(bbox_right, bbox_bottom, -6, obj_smoke);
        
		    //Rise
		    alarm[0] = 60;
		}
	}

	//Otherwise if ascending and nearby the start point, stop.
	else if (ready == 3) && (y < ystart+1) {

		//Change state
		ready = 0;
    
		//Stop vertical movement
		yspeed = 0;
		y = ystart;
	}
#endregion

//If not moving, check player position
if (ready == 0) {

	//If Mario does not exist
	if (!instance_exists(obj_mario))
	|| (obj_mario.y < y)
	    image_index = 0;
        
	//Otherwise
	else {
    
	    //If Mario is 64 pixels nearby, set peekin' pose
	    if (obj_mario.x > bbox_left-64)
	    && (obj_mario.x < bbox_right+64) {
			
			if (obj_mario.x < x)
				image_index = 2;
			else
				image_index = 1;
		}
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