/// @description Ceiling Buzzy Beetle

//If the buzzy is in the ceiling
if (ready == 0) {
	
	//Manage pseudo movement variables
	if (freeze == false) {
	
		x += xspeed;
	}

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If the player is nearby
        if (obj_mario.x > x-32)
        && (obj_mario.x < x+32) 
        && (obj_mario.y > y) {
        
            //Set the sprite
            sprite_index = spr_shell_buzzy;
            
            //Stop animation
            image_speed = 0;
            image_index = 0;
        
            //Stop horizontal speed
            xspeed = 0;
            
            //Drop
            ready = 1;
        }
    }
	
	//Turn at enemies
	event_user(2);
	
	//Turn at walls script
	event_user(5);
    
    //Make sure if does not wall off ceilings
    if ((xspeed < 0) && (!position_meeting(bbox_left, y-4, obj_solid)))
    || ((xspeed > 0) && (!position_meeting(bbox_right, y-4, obj_solid)))
        xspeed = -xspeed;
}

//Otherwise, if the buzzy beetle is falling
else {
	
	//Inherit the parent event
    event_inherited();
    
    //Check if in ground and move towards the player as a shell
    if (yadd == 0) {
    
        //Create a shell
        with (instance_create_depth(x, y, -2, obj_shell_kicked)) {
        
            //Set the sprite of the shell
            sprite_index = spr_shell_buzzy;
            
            //Make sure it wakes up
            koopainside = -1;
			
			//Make sure it's flipped
			flip = 1;
            
            //Move towards Mario
            if (!instance_exists(obj_mario))
            || (obj_mario.x < x) {
            
                prevxspeed = -2.7;
                xspeed = -2.7;
            }
            else {
            
                prevxspeed = 2.7;
                xspeed = 2.7;
            }            
        }
        
        //Destroy
        instance_destroy();
    }
}

//Set the facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;