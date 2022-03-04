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
    
	    //Set the horizontal speed
	    xspeed = 0.5*sign(obj_mario.xscale);
	}

	//Otherwise, if neither 'Up' or 'Down' is pressed
	else {

		//Play 'Kick' sound.
        audio_play_sound(snd_kick, 0, false);
    
        //Create thump
	    with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
        
        //If the player is at the left of the block
        if (obj_mario.x < x) {
        
            with (instance_create_depth(x, y, -2, obj_shell_kicked)) {
            
                //Set the horizontal speed
                xspeed = (2.7+(abs(obj_mario.xspeed)/4));
                
                //Hereby old shell variables
                sprite_index = other.sprite_index;
                koopainside = other.koopainside;
                flip = other.flip;
                
                //Move up if overlapping a slope
                if (collision_rectangle(x-2, bbox_top, x+2, bbox_bottom, obj_slopeparent, 1, 0))
                    y -= 4;
            }
        }
            
        //Otherwise, if the player is at the right of the block
        else if (obj_mario.x > x) {
        
            with (instance_create_depth(x, y, -2, obj_shell_kicked)) {
            
                //Set the horizontal speed
                xspeed = -(2.7+(abs(obj_mario.xspeed)/4));
                
                //Hereby old shell variables
                sprite_index = other.sprite_index;
                koopainside = other.koopainside;
                flip = other.flip;
                
                //Move up if overlapping a slope
                if (collision_rectangle(x-2, bbox_top, x+2, bbox_bottom, obj_slopeparent, 1, 0))
                    y -= 4;
            }
        }
            
        //Otherwise, if the player is turning
        else if (obj_mario.turning == 1) {
                   
            with (instance_create_depth(x, y, -2, obj_shell_kicked)) {
            
                //Set the horizontal speed
                xspeed = (2.7+(abs(obj_mario.xspeed)/4));
                
                //Hereby old shell variables
                sprite_index = other.sprite_index;
                koopainside = other.koopainside;
                flip = other.flip;
                
                //Move up if overlapping a slope
                if (collision_rectangle(x-2, bbox_top, x+2, bbox_bottom, obj_slopeparent, 1, 0))
                    y -= 4;
            }
        }
        
        //Destroy
        instance_destroy();                        
	}
	
	//Reset alarms
    offset = 0;
    alarm[0] = 312;
    alarm[1] = 432;

	//If the object is underwater, begin swim
	swimming = (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0)) ? true : false;
}