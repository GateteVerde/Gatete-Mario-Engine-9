/// @description Chargin' Chuck logic

//Inherit event from parent
event_inherited();

#region JUMP

	//If running or jumping
	if (sprite_index == spr_charginchuck_walk) {

		//Jump when a wall is reached
		if ((xspeed < 0) && (collision_rectangle(bbox_left + xspeed - 1, bbox_top + 4, bbox_left - 1, bbox_bottom - 1, obj_solid, 0, 0)))
		|| ((xspeed > 0) && (collision_rectangle(bbox_right + 1, bbox_top + 4, bbox_right + xspeed + 2, bbox_bottom - 1, obj_solid, 0, 0))) {
    
			//If there's no gravity, hop
			if ((yadd == 0) && (jumping == 0)) {
        
			    //Set the jumping sprite
			    sprite_index = spr_charginchuck_jump;
            
			    //Do not animate
			    image_speed = 0;
			    image_index = 0;
            
			    //Set the vertical speed
			    yspeed = -5;
            
			    //Boost jump
			    y--;
				
				//Set jumping
				jumping = 1;
			}
		}
	}

	//Otherwise if damaged
	else if (sprite_index == spr_charginchuck_damage) {
    
		//If there's no gravity
		if (yadd == 0) {
    
			//Stop horizontal speed
			xspeed = 0;
    
			//If not moving
			if (image_speed == 0)
			    image_speed = 1;
		}
	}	
	
	//Move away from walls
	while ((xspeed < 0) && (collision_rectangle(bbox_left + xspeed - 1, bbox_top + 4, bbox_left - 1, bbox_bottom - 1, obj_solid, 0, 0)))
		x += abs(xspeed);
	while ((xspeed > 0) && (collision_rectangle(bbox_right + 1, bbox_top + 4, bbox_right + xspeed + 2, bbox_bottom - 1, obj_solid, 0, 0)))
		x -= abs(xspeed);
#endregion

#region LOGIC

	//If there's no gravity
	if (yadd == 0) {
    
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
				
				#region BREAK THRU BLOCKS
				
					//If the chargin chuck is charging at mario
					if (sprite_index == spr_charginchuck_walk) {
				
						block = [
					
							obj_brick,
							obj_brick_big,
							obj_brick_blue,
							obj_brick_red,
							obj_brick_gray,
							obj_brick_green,
							obj_flipblock,
							obj_flipblock_triple,
							obj_flipblock_big
						]
				
						//Set up the items that can break this block
						for (var i=0; i < array_length(block); i++) {
					
							var ob = collision_rectangle(bbox_left - 5, bbox_top - 8, bbox_right + 4, bbox_bottom, block[i], 0, 0)
							if (ob)
								with (ob) event_user(15);
						}
					}
				
				#endregion
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
	                }
	            }
	        }
		}
	}
	
	//Set chargin' frame when falling
	else if (jumping == 1) && (yspeed > 0) {
		
		//Set sprite
		sprite_index = spr_charginchuck_walk;
		image_speed = 1;
		image_index = 0;
		
		//Allow jump
		jumping = 0;
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