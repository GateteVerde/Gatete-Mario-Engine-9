/// @description Generate enemies

//If this object is not frozen
if (freeze == false) {
	
	//Handle pseudo movement variables
	x += xspeed;
	y += yspeed;

	if (ready == 0) {

		//If the player exists and it's not transforming and there's less than 6 enemies of the specified object and the gray switch is not active.
		if (outside_view() == false)
		&& (instance_number(object) < 6)
		&& (obj_levelcontrol.gswitch_on == false) {
		
			//Do not spawn if there's a solid in the way out
			if ((dir == 0) && (!collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_solid, 0, 0)))
			|| ((dir == 90) && (!collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top, obj_solid, 0, 0)))	
			|| ((dir == 180) && (!collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_solid, 0, 0)))
			|| ((dir == 270) && (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, obj_semisolid, 0, 0)))
				exit;
			
			//Decrement delay
	        delay--;
	        delayprev++;
        
	        //Generate a enemy
	        if (delay < 1) {
    
	            //Begin generating an enemy
	            ready = 1;
            
	            //Reset delay
	            delay = delayprev;
	            delayprev = 0;
        
	            //Set up movement
				switch (dir) {
				
					//0
					case (0): xspeed = spd; break;
					
					//90
					case (90): yspeed = -spd; break;
					
					//180
					case (180): xspeed = -spd; break;
					
					//270
					case (270): yspeed = spd; break;
				}
	        }		
		}
	
		//Face Mario but only if it exists and dir is set to 90 or 270
	    if (dir == 90)
	    || (dir == 270) {
        
	        if (!instance_exists(obj_mario))
	        || (obj_mario.x < x)
	            xscale = -1;
	        else
	            xscale = 1;
	    }
		else
			xscale = (dir == 0) ? 1 : -1;
	}

	//Generate
	else if (ready == 1) {

	    //Keep moving until there's no solid overlapping
	    if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 0)) {
    
	        //Create the object
	        with (instance_create_depth(x, y, -2, object)) {
        
	            //Set up the motion
	            if (other.xspeed != 0) {
                      
	                xspeed = other.xspeed;
	                xscale = 1*sign(other.xspeed);
	            }
	            else {
                       
	                xspeed = other.spd*sign(other.xscale);
	                xscale = 1*sign(other.xscale);
	            }
	        }
        
	        //Stop movement
	        xspeed = 0;
	        yspeed = 0;
        
	        //Return to the start position
	        x = xstart;
	        y = ystart;
          
	        //Wait
	        ready = 0;
	    }
	}
}

//Hereby the sprite and check it
sprite_index = object_get_sprite(object);