/// @description SMB3 / SMW Holdable Item logic (When held)

if (held == true) {

    //Do not allow swim
    swimming = false;
    
    //If the player does exist
    if (instance_exists(obj_mario)) {
    
        //If the player control is not disabled and Mario does not have either Tiny or Mega powerups
		if (obj_mario.enable_control == true) {
        
	        //If the player is turning
	        if (obj_mario.turning == 1) {
            
	            //Set the depth
	            depth = -6;
                
	            //Snap into player's x position
	            x = obj_mario.x;
	        }
            
	        //Otherwise
	        else {
            
	            //Set depth
	            depth = obj_mario.depth+1;
                
	            //Snap into player's x position
	            if (obj_mario.state == playerstate.climb)
	                x = obj_mario.x;
	            else
	                x = obj_mario.x+(10*sign(obj_mario.xscale));
	        }
            
	        //Make the player hold the item
	        if (input_check(input.action_1))
	            obj_mario.holding = 2;
                
	        //Otherwise, release the item
	        else {
            
	            //Make the player stop holding
	            obj_mario.holding = 0;
                
	            //Stop being held
	            held = false;
                
	            //Set the depth
	            depth = -2;
                
		        //Kick the item
		        event_user(2);
                
		        //Make the player 'Kick' the item if there's input
				if (obj_mario.xspeed != 0)
		        || ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
                
					with (obj_mario) {
					
						kicking = 2;
						timer(kicking_end, 10, false);
					}
				}
	        }
            
	        //Set the direction
	        dir = obj_mario.xscale;
            
	        //If the player is crouched down
	        if (obj_mario.crouch == true)
	            y = obj_mario.y;
                
	        //Otherwise
	        else {
                
	            //If the player is big
	            if (obj_mario.mask_index != spr_mask_mario_big)
	                y = obj_mario.y-2;
	            else
	                y = obj_mario.y-4;
			}
	    }
        
		//Otherwise if controls are disabled, stop holding.
		else if (!instance_exists(obj_mario_transform)) {
        
		    //Make the player stop holding
		    obj_mario.holding = 0;
            
		    //Stop being held
		    held = false;
            
		    //Set the depth
		    depth = -2;
            
		    //Kick the item
		    event_user(2);
            
		    //Make the player 'Kick' the item if there's input
			if (obj_mario.xspeed != 0)
		    || ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
                
				with (obj_mario) {
					
					kicking = 2;
					timer(kicking_end, 10, false);
				}
			}
        
	        //Make visible always
	        visible = 1;
		}
    }
    
    //Otherwise, check who is holding this item
    else {
    
        //Check what object is holding
        event_user(13);
		
		/*
        
        //Then check if it exists
        if (instance_exists(follow)) {
        
            //Snap into position
            x = follow.x;
            y = follow.y;
            
            //Make it invisible
            visible = 0;
            
            //With the followed object
            with (follow) {
            
                holding = 1;
                myitem = other.sprite_index;
                myframe = other.image_index;
            }
        }
		
		*/
    }
	
	//If Mario does have the tiny, mega or balloon powerup
	if (global.powerup == cs_tiny)
	|| (global.powerup == cs_mega) 
	|| (instance_exists(obj_mario_balloon)) {
	
		held = false;
		if (obj_mario.holding > 0)
			obj_mario.holding = 0;
	}
	
	//If Mario does not exist, release
	if (follow == noone)
    && (instance_number(obj_mario) == 0)
        held = false;
}

//If not held, inherit default event
if (!held)
    event_inherited();