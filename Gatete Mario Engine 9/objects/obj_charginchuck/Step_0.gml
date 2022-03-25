/// @description Chargin' Chuck logic

//Inherit event from parent
event_inherited();

#region JUMP

	//Push value
	xx = abs(xspeed);

	//If running or jumping
	if (sprite_index == spr_charginchuck_walk) 
	|| (sprite_index == spr_charginchuck_jump) {

		//Jump when a wall is reached
		if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed*2, bbox_top+4, bbox_left+xspeed*2, bbox_bottom-1, obj_solid, 0, 0)))
		|| ((xspeed > 0) && (collision_rectangle(bbox_right+xspeed*2, bbox_top+4, bbox_right+xspeed*2, bbox_bottom-1, obj_solid, 0, 0))) {
    
			//If there's no gravity, hop
			if (yadd == 0) {
        
			    //Set the jumping sprite
			    sprite_index = spr_charginchuck_jump;
            
			    //Do not animate
			    image_speed = 0;
			    image_index = 0;
            
			    //Set the vertical speed
			    yspeed = -4.5;
            
			    //Boost jump
			    y--;
			}
		}
    
		//Move away from walls
		if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed, bbox_top+4, bbox_left+xspeed, bbox_bottom-1, obj_solid, 0, 0)))
			x += xx;
		if ((xspeed > 0) && (collision_rectangle(bbox_right+xspeed, bbox_top+4, bbox_right+xspeed, bbox_bottom-1, obj_solid, 0, 0)))
			x -= xx;    
	}

	//Otherwise if damaged
	else {
    
		//If there's no gravity
		if (yadd == 0) {
    
			//Stop horizontal speed
			xspeed = 0;
    
			//If not moving
			if (image_speed == 0)
			    image_speed = 1;
		}
    
		//Move away from walls
		if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed, bbox_top+4, bbox_left+xspeed, bbox_bottom-1, obj_solid, 0, 0)))
			x += xx;
		if ((xspeed > 0) && (collision_rectangle(bbox_right+xspeed, bbox_top+4, bbox_right+hspeed, bbox_bottom-1, obj_solid, 0, 0)))
			x -= xx;
	}	
#endregion

#region LOGIC

	//If there's no gravity
	if ((yadd == 0) && (yspeed == 0)) {
		
		//If jumping...
	    if (sprite_index == spr_charginchuck_jump) {
    
	        //Set the running sprite
	        sprite_index = spr_charginchuck_walk;
        
	        //Set frame
	        image_index = 1;
        
	        //Set horizontal speed
	        if (lookout == 0)
	            image_speed = 0.5;
	        else
	            image_speed = 1;        
	    }
    
	    //If Mario does exist
	    if (instance_exists(obj_mario)) {
        
	        //Always charge at Mario if in lookout mode
	        if (lookout == 1) {
        
	            //If Mario managed to get away...
	            if (xspeed < 0) && (obj_mario.x > x+32)
	            || (xspeed > 0) && (obj_mario.x < x-32) {
            
	                //Stop animation
	                sprite_index = spr_charginchuck;
                
	                //Stop horizontal speed
	                xspeed = 0;
                
	                //Reset lookout
	                lookout = -1;
                
	                //Charge at Mario again
	                alarm[10] = 32;
	            }
	        }
	        else if (lookout == 0) {
        
	            //If Mario is not above
	            if (obj_mario.bbox_bottom > y-16) {
            
	                //If the chuck is moving to the right
	                if ((xspeed > 0) && (obj_mario.x > x)) 
	                || ((xspeed < 0) && (obj_mario.x < x)) {
                
	                    //Double horizontal speed
	                    xspeed = xspeed*1.75;                    
                    
	                    //Activate lookout mode
	                    lookout = 1;
                                 
	                    //Stop alarm 1
	                    alarm[1] = -1;
                    
	                    //Set animation speed
	                    image_speed = 1;
                    
	                    //If there's not gravity, set dash sprite
	                    if (yadd == 0)
	                        sprite_index = spr_charginchuck_walk;
	                }
	            }
	        }
	    }
	}
#endregion

//If not moving
if (xspeed == 0) {

    //If Mario does not exist or it's at the left
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;    
}

//Otherwise if moving, face towards direction
else
    xscale = 1*sign(xspeed);