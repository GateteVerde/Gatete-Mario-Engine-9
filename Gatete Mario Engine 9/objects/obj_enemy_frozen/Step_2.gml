/// @description SMB3 / SMW Holdable Item logic (When held)

if (held == true) {

    //Do not allow swim
    swimming = false;
    
    //If the player does exist
    if (instance_exists(obj_mario)) {
		
		//Make object visible
		visible = 1;
		
		//Set the direction
	    dir = obj_mario.xscale;
    
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
	            else {
					
					if (dir == 1)
						x = obj_mario.bbox_right + sprite_width / 2;
					else
						x = obj_mario.bbox_left - sprite_width + (sprite_width / 2);
				}
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
						alarm[5] = 10;
					}
				}
	        }
            
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
					alarm[5] = 10;
				}
			}
        
	        //Make visible always
	        visible = 1;
		}
    }
    
    //Otherwise, if Mario does not longer exist, stop holding
    else {
		
        held = false;
	}
 
	//If Mario does have the tiny, mega or balloon powerup
	if (global.powerup == cs_tiny)
	|| (global.powerup == cs_mega) 
	|| (instance_exists(obj_mario_balloon)) {
	
		held = false;
		if (obj_mario.holding > 0)
			obj_mario.holding = 0;
	}
}

//If not held, inherit default event
if (!held)
    event_inherited();