/// @description SMB2 Holdable Item logic (Player)

//If this object is being held.
if (held) {

	//If Mario does exist.
	if (instance_exists(obj_mario)) {
        
	    //Force player hold
	    obj_mario.holding = 1;
        
	    //Make it visible
	    visible = 1;
		
		//Stay in front
		depth = -6;
        
	    //Snap onto Mario's x position
	    x = obj_mario.x;
        
	    //Snap onto the Mario's y position        
	    if (obj_mario.crouch) { //If the player is crouched down.
        
	        //If Mario is small.
	        if (global.powerup == cs_small)
	            y = obj_mario.y-9;
	        else
	            y = obj_mario.y-12;
	    }
        
	    //Otherwise, if it's not.
	    else {
        
	        //If Mario is small.
	        if (global.powerup == cs_small)
	            y = obj_mario.y-12;
	        else
	            y = obj_mario.y-20;
	    }
	}
    
	//Otherwise
	else {
            
	    //Check what object is holding first
	    event_user(15);
        
	    //Then check if it exists
	    if (instance_exists(follow)) {
            
	        //Set the position of the item.
	        x = follow.x;
	        y = follow.y;
            
	        //Make it invisible.
	        visible = 0;
            
	        //Make said object hold the item
	        follow.holding = 1;
            
	        //Set up the item's sprite
	        follow.myitem = sprite_index;
            
	        //Set up the item's frame.
	        follow.myframe = image_index;            
	    }            
	}
	
	//If Mario does have the tiny, mega or balloon powerup
	if (held)
	&& (global.powerup == cs_tiny)
	|| (global.powerup == cs_mega) 
	|| (instance_exists(obj_mario_balloon)) {
	
		xspeed = 2.5 * sign(obj_mario.xscale);
		held = false;
		if (obj_mario.holding > 0)
			obj_mario.holding = 0;
	}
    
	//Release if the player dies
	if (!instance_exists(obj_mario))
	&& (follow == noone) {

		xspeed = 2.5 * sign(obj_mario.xscale);
	    held = false;
	}
}

//Otherwise, if the item is not being held
else if (held == false) {

    //Make sure the semisolid follows
    if (instance_exists(mytop)) {
        
        mytop.x = x-8;
        mytop.y = bbox_top;
        
        //If the player is on this moving platform
        if (collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
        && (obj_mario.bbox_bottom < yprevious+5)
        && (obj_mario.state < 2) {
        
            //Snap the player vertically
            obj_mario.y = ceil(bbox_top-15);
        
            //Move the player horizontally if there is no solid in his way
            if (xspeed < 0) && (!collision_rectangle(obj_mario.bbox_left+xspeed, obj_mario.bbox_top+4, obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_solid, 0, 0))
            || (xspeed > 0) && (!collision_rectangle(obj_mario.bbox_right, obj_mario.bbox_top+4, obj_mario.bbox_right+xspeed, obj_mario.bbox_bottom-1, obj_solid, 0, 0))
                obj_mario.x += xspeed;
        }
    }
	
	//Set depth
	depth = -2;
}