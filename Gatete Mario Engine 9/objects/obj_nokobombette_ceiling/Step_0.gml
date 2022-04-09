/// @description Ceiling Nokobombette logic

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
            sprite_index = spr_nokobombette_down_th;
        
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
    
    //Check if in ground and blow up if so
    if (yadd == 0) {
    
        instance_create_depth(x, y, -2, obj_explosion);
        instance_destroy();
		exit;
    }
}

//Set the facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;