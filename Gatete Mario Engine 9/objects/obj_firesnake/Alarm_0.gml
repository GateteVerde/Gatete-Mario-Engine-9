/// @description Jump towards Mario

if (yadd == 0) 
&& (freeze == false) {

    //Set the horizontal speed
    xspeed = 0.5*sign(xscale);
    prevxspeed = xspeed;
    
    //Set the vertical speed.
    if (instance_exists(obj_mario)) { //If Mario does exist.
    
        //If Mario is above.
        if (obj_mario.y < y) {
        
            //Set the vertical speed.
            yspeed = -3.2;
            
            //Jump
            jumping = 1;
            
            //Make the body jump too.
            for (i=0; i<4; i++) {
				
				//If this body part exists
				if (instance_exists(mybody[i])) {
            
	                mybody[i].alarm[0] = 5+(5*i)
	                mybody[i].jump_type = 0;  
				}
            }
        }
        
        //otherwise, if it's below or in the same y position.
        else if (obj_mario.y >= y) {

            //Set the vertical speed.
            yspeed = -1.75;
            
            //Jump
            jumping = 1;
            
            //Otherwise, if it's below.
            if (obj_mario.y > y) {
            
                //Check for nearby solid areas and allow jumping.
                mysolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0);
                if (mysolid) 
                && (mysolid.image_yscale <= 1) 
                && (mysolid.object_index != obj_solid) {
					
					var tilemap = layer_tilemap_get_id("Tileset_Platform_Foreground");
                    
                    //If there's a foreground platform tile below
                    if (tilemap_get_at_pixel(tilemap, x, bbox_bottom+1) != 0) {
                        
                        //Pass through semisolids
                        ready = 1;
                        
                        //Make the body jump too.
                        for (i=0; i<4; i++) {
                        
							//If this body part exists
							if (instance_exists(mybody[i])) {
            
				                mybody[i].alarm[0] = 5+(5*i)
				                mybody[i].jump_type = 2;  
							}              
                        }
                    }
                    
                    //Otherwise, do not allow the fire snake to pass through semisolids
                    else {
                    
                        //Make the body jump too.
                        for (i=0; i<4; i++) {
                        
							//If this body part exists
							if (instance_exists(mybody[i])) {
            
				                mybody[i].alarm[0] = 5+(5*i)
				                mybody[i].jump_type = 1;  
							}             
                        }                                                    
                    }
                }
                else {
                
                    //Make the body jump too.
                    for (i=0; i<4; i++) {
                    
						//If this body part exists
						if (instance_exists(mybody[i])) {
            
			                mybody[i].alarm[0] = 5+(5*i)
			                mybody[i].jump_type = 1;  
						}              
                    }                    
                }
            }
            else if (obj_mario.y == y) {
            
                //Make the body jump too.
                for (i=0; i<4; i++) {
                
					//If this body part exists
					if (instance_exists(mybody[i])) {
            
		                mybody[i].alarm[0] = 5+(5*i)
		                mybody[i].jump_type = 1;  
					}              
                }
            }
        }
    }
    
    //Otherwise, if it does not exist.
    else {
        
        //Set the vertical speed.
        yspeed = -3.2;
        
        //Jump
        jumping = 1;
        
        //Make the body jump too.
        for (i=0; i<4; i++) {
        
			//If this body part exists
			if (instance_exists(mybody[i])) {
            
	            mybody[i].alarm[0] = 5+(5*i)
	            mybody[i].jump_type = 1;  
			}         
        }
    }
}
else {

    alarm[0] = 1;
    exit;
}
