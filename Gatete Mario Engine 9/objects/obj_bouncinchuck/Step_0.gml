/// @description Bouncin' Chuck logic

//Push value
xx = abs(xspeed);

#region

	//Inherit the parent event
	event_inherited();
    
	//If there's no gravity
	if (yadd == 0) {
    
	    //If the chuck is jumping
	    if (jumping == 0) {
        
	        //If Mario does exist and it's nearby this enemy
	        if (instance_exists(obj_mario)) 
	        && (obj_mario.x > bbox_left-64)
	        && (obj_mario.x < bbox_right+64) {
            
	            //Set charge frame
	            image_index = 1;
    
	            //Begin jump
	            jumping = 1;
                
	            //Begin shake
	            alarm[1] = 1;
                
	            //Perform jump in player's direction
	            alarm[2] = 60;
	        }
	    }
        
	    //Otherwise, if the chuck is jumping
	    else if (jumping == 2) {
        
	        //Set jumping state
	        jumping = 3;
        
	        //Stop horizontal speed
	        xspeed = 0;
            
	        //Allow jumping
	        alarm[0] = 30;
        
	        //Set up default sprite
	        if (image_index != 0)
	            image_index = 0;
	    }
	}
    
	//Move away from walls
	if ((xspeed < 0) && (collision_rectangle(bbox_left+xspeed, bbox_top+4, bbox_left+xspeed, bbox_bottom-1, obj_solid, 0, 0)))
	    x += xx;
	if ((xspeed > 0) && (collision_rectangle(bbox_right+xspeed, bbox_top+4, bbox_right+xspeed, bbox_bottom-1, obj_solid, 0, 0)))
	    x -= xx;	
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