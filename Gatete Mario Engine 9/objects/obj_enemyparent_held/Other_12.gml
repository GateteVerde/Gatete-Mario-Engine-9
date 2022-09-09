/// @description Default throw / kick event

//Shatter if inside a solid
if (place_meeting(x, y, obj_solid)) {

    //Play 'Bump' sound
    audio_play_sound(snd_bump, 0, false);
    
    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);
    
    //Get 100 points
    with (instance_create_depth(x, y, -6, obj_score)) value = 100;
	
	//Force end kicking on Mario
	if (instance_exists(obj_mario)) {
		
		if (obj_mario.kicking > 0)
			obj_mario.kicking = 0;
	}
    
    //Kill the enemy
	killer_id = -1;
    event_user(0);
}

//Otherwise
else {

	//If 'Up' is pressed, throw it upwards
	if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

	    //Play 'Kick' sound
	    audio_play_sound(snd_kick, 0, false);
    
	    //Create thump
	    with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
    
	    //If the item is not overlapping a solid
	    if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 1, 0)) {
    
	        //Set the horizontal speed
	        xspeed = obj_mario.xspeed/1.5;
        
	        //Boost kick
	        y--;
			
			//Throw upwards
			thrown_up = true;
        
	        //Set vertical speed based if it is underwater or not
			yspeed = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? -3.5 : -7;
	    }
    
	    //Otherwise, get embed
	    else
	        inwall = true;
	}

	//Otherwise if 'Down' is pressed, leave it on the ground
	else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
    
	    //Check if the object is stuck on a solid and move it
	    if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 1, 0)) {
    
	        //Move it to a safe position
	        inwall = true;
        
	        //Stop it
	        xspeed = 0;
	    }
		
		//Thrown up?
		thrown_up = false;
    
	    //Set the horizontal speed
	    xspeed = 0.5*sign(obj_mario.xscale);
	}

	//Otherwise, if neither 'Up' or 'Down' is pressed
	else {

	    //If the item is not overlapping a solid.
	    if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,obj_solid, 0, 0)) {
			
			//Thrown up
			thrown_up = false;
        
	        //If the player has horizontal speed
	        if (obj_mario.xspeed != 0) {
        
	            //Play 'Kick' sound.
	            audio_play_sound(snd_kick, 0, false);
    
	            //Create thump
	            with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
            
	            //Set vertical speed based if it is underwater or not
				yspeed = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? -1 : -2;
            
	            //If the object is not on contact with a slope
	            if (!collision_rectangle(x-2, bbox_bottom-4, x-2, bbox_bottom, obj_slopeparent, 1, 0))
	                xspeed = (obj_mario.xspeed+1*obj_mario.xscale)/1.5;
                
	            //Otherwise, do not apply horizontal speed
	            else
	                xspeed = 0.5*sign(obj_mario.xscale);
	        }
        
	        //Otherwise, leave it on the ground
	        else
	            xspeed = 0.5*obj_mario.xscale;
	    }
	    else
	        inwall = true;
	}

	//If the object is underwater, begin swim
	swimming = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? true : false;
}