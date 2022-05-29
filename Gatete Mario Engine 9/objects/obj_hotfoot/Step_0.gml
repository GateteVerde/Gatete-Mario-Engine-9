/// @description Hotfoot logic

//Inherit the parent event
event_inherited();

//Prevent getting embed in walls
if (sprite_index != spr_hotfoot) {

    //If moving left and there's a wall in position
    if (xspeed < 0) 
	&& (collision_rectangle(bbox_left+xspeed, bbox_top+4, bbox_left+xspeed, bbox_bottom-1, obj_solid, 0, 0))
        x += 0.5;
		
	//Otherwise, if moving right
    if (xspeed > 0) 
	&& (collision_rectangle(bbox_right+xspeed, bbox_top+4, bbox_right+xspeed, bbox_bottom-1, obj_solid, 0, 0))
        x -= 0.5; 
}

#region LOGIC

	//If Mario does exist and it's not looking at him.
	if (instance_exists(obj_mario))
	&& (movenow = 1) {

	    //If Mario is at the right
	    if (obj_mario.x > x+4) {
    
	        xspeed = 0.5;
	        xscale = 1;
	    }
    
	    //Otherwise, if Mario is at the left
	    else if (obj_mario.x < x-4) {
    
	        xspeed = -0.5;
	        xscale = -1;
	    }
	}

	//Otherwise, stop moving
	else {
		
		xspeed = 0;
	}

	//Check if Mario is not looking at the hotfoot
	if (instance_exists(obj_mario)) {

	    //If Mario is not spinjumping
	    if (obj_mario.jumpstyle != 1) {
    
	        //If Mario is at the right of the hotfoot
	        if (obj_mario.x > x+4) {
        
	            //If Mario is looking at the right, move
	            if (obj_mario.xscale == 1)
	                movenow = 1;
                
	            //Otherwise, do not move
	            else
	                movenow = 0;
	        }
        
	        //Otherwise if Mario is at the left of the hotfoot
	        else if (obj_mario.x < x-4) {
        
	            //If Mario is looking at the left, move
	            if (obj_mario.xscale == -1)
	                movenow = 1;
            
	            //Otherwise, do not move
	            else
	                movenow = 0;
	        }
        
	        //Otherwise, do not move
	        else
	            movenow = 0;
	    }
    
	    //Otherwise, stop
	    else
	        movenow = 0;
	}

	//Otherwise, do not move
	else {
		
	    movenow = 0;
	}
#endregion

//Sprite
sprite_index = (movenow) ? spr_hotfoot_walk : spr_hotfoot;

//Facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;
